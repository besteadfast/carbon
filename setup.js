import fs from 'fs/promises';
import readline from 'readline';
import getMetricsFromStylesheet from "./getMetricsFromStylesheet.mjs";

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function question(query) {
  return new Promise(resolve => rl.question(query, resolve));
}

async function setup() {
  try {
    const adobeUrl = await question('If using Adobe Typekit, enter the URL (leave empty to skip): ');
    const googleUrl = await question('If using Google Fonts, enter the URL (leave empty to skip): ');
    let fontsString = '';
    let adobeFontMetrics = null;
    let googleFontMetrics = null;
    let fontsObj = null;
    
    if (adobeUrl || googleUrl) {
      console.log('Fetching font metrics...');
      if (adobeUrl) {
        adobeFontMetrics = await getMetricsFromStylesheet('adobe', adobeUrl);
      }
      if (googleUrl) {
        googleFontMetrics = await getMetricsFromStylesheet('google', googleUrl);
      }
      
      console.log('Updating carbon.mjs with font metrics...');
      
      // Transform the metrics into the expected format
      fontsObj = {};

      if(adobeFontMetrics){
        for (const [key, metrics] of Object.entries(adobeFontMetrics)) {
          fontsObj[key] = {
            family: [key, 'sans-serif'],
            metrics: metrics,
          };
        }
      }

      if(googleFontMetrics){
        for (const [key, metrics] of Object.entries(googleFontMetrics)) {
          fontsObj[key] = {
            family: [key, 'sans-serif'],
            metrics: metrics,
          };
        }
      }
      
      // Create the fonts object string with proper indentation
      fontsString = JSON.stringify(fontsObj, null, 2)
        .replace(/"([^"]+)":/g, (match, key) => {
          // Only quote keys with hyphens
          return key.includes('-') ? `"${key}":` : `${key}:`;
        })
        .replace(/: "([^"]+)"/g, ': \'$1\'');  // Use single quotes for string values
      
      // Fix indentation to use tabs and add one extra level
      fontsString = fontsString
        .replace(/  /g, '\t')
        .split('\n')
        .map(line => line ? '\t' + line : line)
        .join('\n');
      
    }

    // const systemFonts = await question('If using Google Fonts, enter the full font name (comma-separated) (leave empty to skip): ');
    // if (systemFonts) {
    //   const systemFontsArray = systemFonts.split(',').map(font => font.trim());
    //   console.log('Adding system fonts:', systemFontsArray);
      
    //   // Import metrics for each system font
    //   await Promise.all(
    //     systemFontsArray.map(async (font) => {
    //       try {
    //         // Convert font name to lowercase and remove spaces for import (e.g., "Geist Mono" -> "geistMono")
    //         const fontImportName = font.toLowerCase().replace(/\s+/g, '');
    //         const metricsModule = await import(`@capsizecss/metrics/${fontImportName}`);
    //         const metrics = metricsModule.default;
            
    //         // Only include the same keys as Adobe Typekit metrics
    //         const strippedMetrics = {
    //           capHeight: metrics.capHeight,
    //           ascent: metrics.ascent,
    //           descent: metrics.descent,
    //           lineGap: metrics.lineGap,
    //           unitsPerEm: metrics.unitsPerEm,
    //           xHeight: metrics.xHeight,
    //         };
            
    //         // Convert font name to kebab-case for the object key
    //         const fontKey = font.replace(/\s+/g, '-').toLowerCase();
            
    //         // Add to existing fontsObj or create new one if it doesn't exist
    //         if (!fontsObj) {
    //           fontsObj = {};
    //         }
    //         fontsObj[fontKey] = {
    //           family: [font, 'sans-serif'], // Keep original name with spaces
    //           metrics: strippedMetrics,
    //         };
    //       } catch (error) {
    //         console.warn(`⚠️  No metrics found for "${font}", using empty metrics`);
    //         if (!fontsObj) {
    //           fontsObj = {};
    //         }
    //         // Convert font name to kebab-case for the object key
    //         const fontKey = font.replace(/\s+/g, '-').toLowerCase();
    //         fontsObj[fontKey] = {
    //           family: [font, 'sans-serif'], // Keep original name with spaces
    //           metrics: {},
    //         };
    //       }
    //     })
    //   );
    // }
    
    // Format the combined fonts object with proper indentation
    if (fontsObj) {
      fontsString = JSON.stringify(fontsObj, null, 2)
        .replace(/"([^"]+)":/g, (match, key) => {
          // Always quote keys, especially those with hyphens
          return `"${key}":`;
        })
        .replace(/: "([^"]+)"/g, ': \'$1\'');  // Use single quotes for string values
      
      // Fix indentation to use tabs and add one extra level
      fontsString = fontsString
        .replace(/  /g, '\t')
        .split('\n')
        .map(line => line ? '\t' + line : line)
        .join('\n');
    }

    // Read the current carbon.mjs file
    const carbonPath = './config/build/carbon.mjs';
    const carbonContent = await fs.readFile(carbonPath, 'utf-8');

    // Replace the fonts object (including any existing content)
    const updatedContent = carbonContent.replace(
      /export const typography = {\s*fonts:\s*{[\s\S]*?}\s*,/,
      `export const typography = {\n\tfonts: ${fontsString},`
    );
    
    // Write the updated content back
    await fs.writeFile(carbonPath, updatedContent);
    
    console.log('✅ Successfully updated carbon.mjs with font metrics!');
    if(fontsObj && Object.keys(fontsObj).length > 0){
      console.log(`Added ${Object.keys(fontsObj).length} font(s):`);
      Object.keys(fontsObj).forEach(key => {
        console.log(`  - ${key}`);
      });
    }
    
  } catch (error) {
    console.error('❌ Error:', error.message);
  } finally {
    rl.close();
  }
}

setup();

