import { fromBuffer } from '@capsizecss/unpack';

export default async function getMetricsFromStylesheet(service, stylesheetUrl) {
    if (!stylesheetUrl) {
        console.error('Please provide a URL');
        process.exit(1);
    }

    async function getMetrics(url) {
        const fontBuffer = await fetch(url).then(res => res.arrayBuffer());
        const fontMetrics = await fromBuffer(fontBuffer);
        return fontMetrics;
    }

    async function parseTypekitUrl(url) {
        const css = await fetch(url).then(res => res.text());
        const declarations = css.split('@font-face').slice(1); // Remove first empty element
        
        const seenFamilies = new Set();
        const filteredDeclarations = [];
        
        for (const declaration of declarations) {
            const familyMatch = declaration.match(/(?<=font-family:\s*['"])([^'"]+)(?=['"])/g);
            if (familyMatch) {
                const fontFamily = familyMatch[0];
                if (!seenFamilies.has(fontFamily)) {
                    seenFamilies.add(fontFamily);
                    filteredDeclarations.push({name: fontFamily, declaration});
                }
            }
        }
        const fonts = filteredDeclarations.map(font => {
            if(service === 'google'){
                return { name: font.name, url: font.declaration.match(/(?<=url\()(.*?)(?=(\)))/g)[0] };
            }
            else{
                return { name: font.name, url: font.declaration.match(/(?<=url\(")(.*?)(?=("\) format\("woff"\)))/g)[0] };
            }
        });
        return fonts;
    }

    
    const fonts = await parseTypekitUrl(stylesheetUrl);

    const fontMetrics = {};

    await Promise.all(fonts.map(async font => {
        const metrics = await getMetrics(font.url);
        const strippedMetrics = {
            capHeight: metrics.capHeight,
            ascent: metrics.ascent,
            descent: metrics.descent,
            lineGap: metrics.lineGap,
            unitsPerEm: metrics.unitsPerEm,
            xHeight: metrics.xHeight,
        }
        fontMetrics[font.name] = strippedMetrics;
    }));

    return fontMetrics;
}