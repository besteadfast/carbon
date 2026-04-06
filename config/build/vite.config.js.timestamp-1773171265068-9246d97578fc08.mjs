// config/build/vite.config.js
import { defineConfig } from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/vite/dist/node/index.js";
import banner from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/vite-plugin-banner/dist/index.mjs";
import compression from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/vite-plugin-compression/dist/index.mjs";
import legacy from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/@vitejs/plugin-legacy/dist/index.mjs";
import manifestSRI from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/vite-plugin-manifest-sri/dist/index.js";
import restart from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/vite-plugin-restart/dist/index.mjs";
import vue from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/@vitejs/plugin-vue/dist/index.mjs";
import { viteCommonjs } from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/@originjs/vite-plugin-commonjs/lib/index.js";

// config/build/postcss.config.js
import postcssImport from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/postcss-import/index.js";
import tailwindcssNesting from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/tailwindcss/nesting/index.js";
import tailwindcss from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/tailwindcss/lib/index.js";

// getAdobeMetrics.mjs
import { fromBuffer } from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/@capsizecss/unpack/dist/index.mjs";

// config/build/carbon.mjs
var colors = {
  white: "#ffffff",
  black: "#000000",
  // Default Tailwind colors
  gray: {
    50: "#f9fafb",
    100: "#f3f4f6",
    200: "#e5e7eb",
    300: "#d1d5db",
    400: "#9ca3af",
    500: "#6b7280",
    600: "#4b5563",
    700: "#374151",
    800: "#1f2937",
    900: "#111827"
  },
  blue: {
    50: "#eff6ff",
    100: "#dbeafe",
    200: "#bfdbfe",
    300: "#93c5fd",
    400: "#60a5fa",
    500: "#3b82f6",
    600: "#2563eb",
    700: "#1d4ed8",
    800: "#1e40af",
    900: "#1e3a8a"
  }
};
var icons = {
  // Example icon size
  12: { abbr: "12", size: "12px", folder: "12" }
};
var shadows = {
  // Example shadow
  card: "0px 4px 24px 2px rgba(17, 72, 102, .08)"
};
var typography = {
  fonts: {
    "area-normal": {
      family: [
        "Area Normal Black",
        "sans-serif"
      ],
      metrics: {
        familyName: "Area Normal Black",
        fullName: "Area Normal Black",
        postscriptName: "AreaNormal-BlackItalic",
        capHeight: 780,
        ascent: 1300,
        descent: -340,
        lineGap: 0,
        unitsPerEm: 1e3,
        xHeight: 558,
        xWidthAvg: 507,
        subsets: {
          latin: {
            xWidthAvg: 507
          },
          thai: {
            xWidthAvg: 866
          }
        }
      }
    },
    "area-normal-light": {
      family: [
        "Area Normal Extralight",
        "sans-serif"
      ],
      metrics: {
        familyName: "Area Normal Extralight",
        fullName: "Area Normal Extralight",
        postscriptName: "AreaNormal-ExtralightItalic",
        capHeight: 780,
        ascent: 1263,
        descent: -248,
        lineGap: 0,
        unitsPerEm: 1e3,
        xHeight: 551,
        xWidthAvg: 494,
        subsets: {
          latin: {
            xWidthAvg: 494
          },
          thai: {
            xWidthAvg: 865
          }
        }
      }
    },
    "inter-variable": {
      family: [
        "Inter",
        "sans-serif"
      ],
      metrics: {
        familyName: "Inter",
        fullName: "Inter",
        postscriptName: "Inter-Regular",
        capHeight: 2048,
        ascent: 3072,
        descent: -900,
        lineGap: 0,
        unitsPerEm: 2816,
        xHeight: 1536,
        xWidthAvg: 1344,
        subsets: {
          latin: {
            xWidthAvg: 1344
          },
          thai: {
            xWidthAvg: 2800
          }
        }
      }
    }
  },
  styles: {
    // Typography styles
    h1: {
      fontFamily: "inter-variable",
      fontWeight: "bold",
      fontSize: { base: "40", md: "52" },
      lineHeight: { base: "130" },
      letterSpacing: "-025",
      uppercase: false,
      spacing: {
        "h1": { base: "s9", md: "s9" },
        "h2": { base: "s10", md: "s9" },
        "p": { base: "s10", md: "s12" },
        "p-sm": { base: "s10", md: "s12" },
        "list": { base: "s10", md: "s12" }
      }
    },
    h2: {
      fontFamily: "inter-variable",
      fontWeight: "bold",
      fontSize: { base: "32", md: "40" },
      lineHeight: { base: "130" },
      letterSpacing: "-025",
      uppercase: false
    },
    h3: {
      fontFamily: "area-normal",
      fontWeight: "bold",
      fontSize: { base: "24", md: "32" },
      lineHeight: { base: "130" },
      letterSpacing: "0",
      uppercase: false
    },
    h4: {
      fontFamily: "area-normal",
      fontWeight: "bold",
      fontSize: { base: "20", md: "24" },
      lineHeight: { base: "130" },
      letterSpacing: "0",
      uppercase: true
    },
    p: {
      fontFamily: "area-normal",
      fontWeight: "normal",
      fontSize: { base: "16", md: "18" },
      lineHeight: { base: "160" },
      letterSpacing: "0",
      uppercase: false
    },
    "p-sm": {
      fontFamily: "area-normal",
      fontWeight: "normal",
      fontSize: { base: "14", md: "16" },
      lineHeight: { base: "160" },
      letterSpacing: "0",
      uppercase: false
    }
  }
};

// config/build/plugins/interact.mjs
function interactVariantPlugin({ addVariant }) {
  addVariant("interact", ["&:hover", "&:focus", "&:active", "&:focus-within"]), // Group variant to allow for interact state based on parent hover
  addVariant("group-interact", [
    ":merge(.group):hover &",
    ":merge(.group):focus &",
    ":merge(.group):focus-within &",
    ":merge(.group):active &"
  ]);
}

// config/build/plugins/typography.mjs
import tailwindcssPlugin from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/tailwindcss/plugin.js";
import { createStyleObject } from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/@capsizecss/core/dist/index.mjs";
var typographyElements = Object.keys(typography.styles).reduce((acc, curr) => {
  return ["h1", "h2", "h3", "h4", "h5", "h6", "p"].includes(curr) ? { ...acc, [curr]: [`.t-${curr}`, `${curr}:not([class^='t-']):not([class*=' t-'])`] } : { ...acc, [curr]: [`.t-${curr}`] };
}, {});
var ruleSetsByScreen = {};
var generateIs = (selectors) => {
  if (Array.isArray(selectors)) {
    return ":is(" + selectors.join(", ") + ")";
  }
  return selectors;
};
var getScreenSize = (screen, theme) => {
  return screen === "base" ? "base" : theme("screens." + screen).replace("px", "");
};
var getMetrics = (family) => {
  return typography.fonts[family].metrics;
};
var generateRuleSetsByScreen = (screenSize, selector, rules) => {
  ruleSetsByScreen[screenSize] = {
    ...ruleSetsByScreen[screenSize],
    [selector]: {
      ...ruleSetsByScreen[screenSize] && {
        ...ruleSetsByScreen[screenSize][selector]
      },
      ...rules
    }
  };
};
var generateCapsizeStyles = (settings, fontSize, lineHeight) => {
  if (!settings.fontFamily || !fontSize || !lineHeight) {
    return {};
  }
  console.log(settings);
  const metrics = getMetrics(settings.fontFamily);
  const capHeight = parseInt(fontSize);
  const pixelLineHeight = parseInt(fontSize) * (parseInt(lineHeight) / 100);
  const lineGap = pixelLineHeight - capHeight;
  const shouldUseMidCap = !settings.uppercase;
  if (shouldUseMidCap) {
    const midCapDiff = (metrics.capHeight - metrics.xHeight) / 2;
    const baseStyles = createStyleObject({
      capHeight,
      lineGap,
      fontMetrics: metrics
    });
    console.log(settings.fontFamily, baseStyles);
    if (baseStyles["::before"]) {
      const originalMargin = parseFloat(baseStyles["::before"].marginBottom);
      baseStyles["::before"].marginBottom = `${originalMargin - midCapDiff / metrics.unitsPerEm}em`;
    }
    return baseStyles;
  }
  return createStyleObject({
    capHeight,
    lineGap,
    fontMetrics: metrics
  });
};
var typographyElementsList = Object.values(typographyElements).flat();
var typographyPlugin = tailwindcssPlugin(function({ addBase, theme }) {
  if (typography.styles) {
    Object.entries(typography.styles).forEach(([element, settings]) => {
      const selector = generateIs(typographyElements[element]);
      const baseStyles = {
        ...settings.fontFamily && {
          fontFamily: theme("fontFamily." + settings.fontFamily)
        },
        ...settings.fontWeight && {
          fontWeight: theme("fontWeight." + settings.fontWeight)
        },
        ...settings.letterSpacing && {
          letterSpacing: theme("letterSpacing." + settings.letterSpacing)
        },
        ...settings.uppercase && { textTransform: "uppercase" }
      };
      generateRuleSetsByScreen("base", selector, baseStyles);
      if (settings.textColor) {
        let [name, shade] = settings.textColor.split("-");
        generateRuleSetsByScreen("base", selector, {
          color: colors[name][shade]
        });
      }
      if (settings.fontSize && settings.lineHeight) {
        const screens = /* @__PURE__ */ new Set([
          ...Object.keys(settings.fontSize),
          ...Object.keys(settings.lineHeight)
        ]);
        screens.forEach((screen) => {
          const fontSize = settings.fontSize[screen] || settings.fontSize.base;
          const lineHeight = settings.lineHeight[screen] || settings.lineHeight.base;
          const screenSize = getScreenSize(screen, theme);
          if (fontSize && lineHeight) {
            const capsizeStyles = generateCapsizeStyles(
              { ...settings, element },
              fontSize,
              lineHeight
            );
            generateRuleSetsByScreen(screenSize, selector, capsizeStyles);
            if (capsizeStyles["::before"]) {
              generateRuleSetsByScreen(screenSize, selector + "::before", {
                ...capsizeStyles["::before"]
              });
            }
            if (capsizeStyles["::after"]) {
              generateRuleSetsByScreen(screenSize, selector + "::after", {
                ...capsizeStyles["::after"]
              });
            }
          }
        });
      }
      if (settings.spacing) {
        Object.entries(settings.spacing).forEach(([comboElement, spacers]) => {
          const comboSelector = generateIs(typographyElements[comboElement]) + " + " + selector;
          Object.entries(spacers).forEach(([screen, spacerSize]) => {
            const screenSize = getScreenSize(screen, theme);
            generateRuleSetsByScreen(screenSize, comboSelector, {
              marginTop: theme("spacing." + spacerSize)
            });
          });
        });
      }
    });
  }
  const allMediaScreens = Object.keys(ruleSetsByScreen).filter(
    (screen) => screen !== "base"
  );
  const sortedMediaScreens = [...allMediaScreens].sort(
    (a, b) => parseInt(a) - parseInt(b)
  );
  const mediaRuleSets = sortedMediaScreens.reduce(
    (acc, screen) => ({
      ...acc,
      ["@media (min-width: " + screen + "px)"]: {
        ...ruleSetsByScreen[screen]
      }
    }),
    {}
  );
  let typographyRuleSets = {
    ...ruleSetsByScreen.base,
    ...mediaRuleSets
  };
  addBase(typographyRuleSets);
});

// config/build/tailwind.config.mjs
var rootFontSize = 16;
var convertToRem = function(pixelValue) {
  let calc = pixelValue / rootFontSize;
  return calc.toFixed(10) + "rem";
};
var generateSteps = function(start, end, multiple = 1, callback) {
  let steps = {};
  const values = Array.from(
    new Array(end - start + 1),
    (v, k) => k + start
  ).filter((n) => n % multiple === 0);
  values.forEach((val) => {
    steps[val] = callback(val);
  });
  return steps;
};
var generateIconSpacingValues = () => Object.entries(icons).reduce(
  (acc, [name, { size }]) => ({
    ...acc,
    [`icon-${name}`]: size
  }),
  {}
);
var generateIconSafelist = () => Object.keys(generateIconSpacingValues()).reduce(
  (acc, iconName) => [`w-${iconName}`, `h-${iconName}`, ...acc],
  []
);
var tailwind_config_default = {
  important: "#appcss",
  content: ["./src/templates/**/*.{twig,html}", "./src/js/**/*.{js,vue}"],
  safelist: [...typographyElementsList, ...generateIconSafelist()],
  theme: {
    extend: {
      borderWidth: {
        1: "1px"
      }
    },
    screens: {
      "tiny": "375px",
      "xs": "560px",
      "sm": "640px",
      "md": "768px",
      "lg": "1024px",
      "xl": "1300px",
      "2xl": "1600px"
    },
    maxWidth: {
      none: "none",
      wide: "1440px"
    },
    colors: {
      transparent: "transparent",
      current: "currentColor",
      ...colors
    },
    fontFamily: Object.keys(typography.fonts).reduce(
      (acc, font) => ({
        ...acc,
        [font]: typography.fonts[font].family
      }),
      {
        // Add default font families
        sans: ["Inter", "system-ui", "sans-serif"],
        serif: ["Georgia", "serif"],
        mono: ["Menlo", "Monaco", "monospace"]
      }
    ),
    fontWeight: {
      thin: "100",
      light: "300",
      normal: "400",
      medium: "500",
      semibold: "600",
      bold: "700",
      extrabold: "800",
      black: "900"
    },
    fontSize: generateSteps(8, 72, 1, (val) => {
      return convertToRem(val);
    }),
    lineHeight: {
      100: "1",
      130: "1.3",
      160: "1.6"
      // 110: '1.1',
      // 120: '1.2',
    },
    letterSpacing: {
      "-01": "-.01em",
      "-025": "-.025em",
      "0": "0",
      "004": ".004em",
      "01": ".01em",
      "02": ".02em",
      "03": ".03em",
      "04": ".04em",
      "05": ".05em",
      "06": ".06em",
      "07": ".07em",
      "08": ".08em",
      "09": ".09em",
      "10": ".1em",
      "20": ".20em"
    },
    dropShadow: {
      none: "none",
      ...shadows
    },
    boxShadow: {
      none: "none",
      ...shadows
    },
    borderRadius: {
      none: "0px",
      DEFAULT: "20px",
      // This value should be replaced with the most common border radius value
      full: "50%",
      pill: "9999px"
    },
    spacing: () => ({
      inherit: "inherit",
      ...generateIconSpacingValues(),
      0: "0px",
      s1: "4px",
      s2: "8px",
      s3: "12px",
      s4: "16px",
      s5: "20px",
      s6: "24px",
      s7: "32px",
      s8: "40px",
      s9: "48px",
      s10: "64px",
      s11: "80px",
      s12: "96px",
      s13: "120px",
      s14: "160px"
    })
  },
  corePlugins: {
    container: false
  },
  plugins: [typographyPlugin, interactVariantPlugin]
};

// config/build/postcss.config.js
import autoprefixer from "file:///Users/btbunze/Documents/Steadfast/carbon/node_modules/autoprefixer/lib/autoprefixer.js";
var postcss_config_default = {
  plugins: [
    postcssImport,
    tailwindcssNesting,
    tailwindcss({
      config: tailwind_config_default
    }),
    autoprefixer
  ]
};

// package.json
var package_default = {
  name: "carbon",
  version: "1.0.0",
  description: "Steadfast's starter project - Craft CMS, Vite, and Docker",
  author: "Steadfast Design Firm",
  license: "UNLICENSED",
  private: true,
  type: "module",
  scripts: {
    dev: "vite --config ./config/build/vite.config.js",
    build: "vite build --config ./config/build/vite.config.js",
    preview: "vite preview --config ./config/build/vite.config.js",
    "build-icons": "svgo -r -f ./web/assets/icons/12 -o ./web/assets/icons/12 --config=./config/build/svgo/icons.js"
  },
  dependencies: {
    "@capsizecss/core": "^4.1.3",
    "@capsizecss/metrics": "^3.6.2",
    "@capsizecss/unpack": "^4.0.0",
    "@fancyapps/ui": "^4.0.31",
    "@headlessui/vue": "^1.6.7",
    "@splidejs/vue-splide": "^0.6.7",
    "@vuepic/vue-datepicker": "^3.6.3",
    algoliasearch: "^4.14.2",
    axios: "^1.2.1",
    "body-scroll-lock": "^4.0.0-beta.0",
    lazysizes: "^5.3.2",
    postcss: "^8.4.31",
    tailwindcss: "^3.3.3",
    terser: "^5.4.0",
    uuid: "^8.3.2",
    "v-scroll-lock": "^1.3.1",
    vue: "^3.2.25",
    "vue-axios": "^3.5.2",
    "vue-router": "^4.1.5"
  },
  devDependencies: {
    "@kitql/vite-plugin-watch-and-run": "^0.3.7",
    "@originjs/vite-plugin-commonjs": "^1.0.3",
    "@vitejs/plugin-legacy": "^4.1.1",
    "@vitejs/plugin-vue": "^4.4.0",
    autoprefixer: "^10.4.7",
    "npm-watch": "^0.11.0",
    onchange: "^7.1.0",
    "postcss-import": "^15.1.0",
    prettier: "2.7.1",
    rimraf: "^3.0.2",
    "rollup-plugin-critical": "^1.0.8",
    svgo: "^2.8.0",
    vite: "^4.4.11",
    "vite-plugin-banner": "^0.3.0",
    "vite-plugin-compression": "^0.5.1",
    "vite-plugin-manifest-sri": "^0.1.0",
    "vite-plugin-restart": "^0.3.1"
  },
  browserslist: [
    "defaults"
  ]
};

// config/build/vite.config.js
import * as path from "path";
var __vite_injected_original_dirname = "/Users/btbunze/Documents/Steadfast/carbon/config/build";
var bannerContent = `/**
 * name: ${package_default.name}
 * version: v${package_default.version}
 * description: ${package_default.description}
 * author: ${package_default.author}
 */`;
var vite_config_default = defineConfig(({ command }) => {
  return {
    base: command === "serve" ? "" : "/dist/",
    build: {
      emptyOutDir: true,
      manifest: true,
      outDir: "./web/dist/",
      rollupOptions: {
        input: {
          main: "./src/js/main.js"
        },
        output: {
          sourcemap: true
        }
      }
    },
    css: {
      postcss: postcss_config_default
    },
    plugins: [
      banner(bannerContent),
      compression({
        filter: /\.(js|mjs|json|css|map)$/i
      }),
      legacy({
        targets: ["defaults", "not IE 11"]
      }),
      manifestSRI(),
      restart({
        reload: ["./src/templates/**/*"]
      }),
      vue(),
      viteCommonjs()
    ],
    resolve: {
      alias: {
        "@src": path.resolve(__vite_injected_original_dirname, "../../src"),
        "@build": path.resolve(__vite_injected_original_dirname, "."),
        "vue": "vue/dist/vue.esm-bundler.js"
      },
      preserveSymlinks: true
    },
    server: {
      host: true,
      port: 8080,
      strictPort: true,
      watch: {
        ignored: ["**/storage/**", "**/vendor/**", "**/web/cpresources/**"]
      },
      cors: true
    }
  };
});
export {
  vite_config_default as default
};
//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAic291cmNlcyI6IFsiY29uZmlnL2J1aWxkL3ZpdGUuY29uZmlnLmpzIiwgImNvbmZpZy9idWlsZC9wb3N0Y3NzLmNvbmZpZy5qcyIsICJnZXRBZG9iZU1ldHJpY3MubWpzIiwgImNvbmZpZy9idWlsZC9jYXJib24ubWpzIiwgImNvbmZpZy9idWlsZC9wbHVnaW5zL2ludGVyYWN0Lm1qcyIsICJjb25maWcvYnVpbGQvcGx1Z2lucy90eXBvZ3JhcGh5Lm1qcyIsICJjb25maWcvYnVpbGQvdGFpbHdpbmQuY29uZmlnLm1qcyIsICJwYWNrYWdlLmpzb24iXSwKICAic291cmNlc0NvbnRlbnQiOiBbImNvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9kaXJuYW1lID0gXCIvVXNlcnMvYnRidW56ZS9Eb2N1bWVudHMvU3RlYWRmYXN0L2NhcmJvbi9jb25maWcvYnVpbGRcIjtjb25zdCBfX3ZpdGVfaW5qZWN0ZWRfb3JpZ2luYWxfZmlsZW5hbWUgPSBcIi9Vc2Vycy9idGJ1bnplL0RvY3VtZW50cy9TdGVhZGZhc3QvY2FyYm9uL2NvbmZpZy9idWlsZC92aXRlLmNvbmZpZy5qc1wiO2NvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9pbXBvcnRfbWV0YV91cmwgPSBcImZpbGU6Ly8vVXNlcnMvYnRidW56ZS9Eb2N1bWVudHMvU3RlYWRmYXN0L2NhcmJvbi9jb25maWcvYnVpbGQvdml0ZS5jb25maWcuanNcIjtpbXBvcnQgeyBkZWZpbmVDb25maWcgfSBmcm9tICd2aXRlJ1xuaW1wb3J0IGJhbm5lciBmcm9tICd2aXRlLXBsdWdpbi1iYW5uZXInXG5pbXBvcnQgY29tcHJlc3Npb24gZnJvbSAndml0ZS1wbHVnaW4tY29tcHJlc3Npb24nXG5pbXBvcnQgbGVnYWN5IGZyb20gJ0B2aXRlanMvcGx1Z2luLWxlZ2FjeSdcbmltcG9ydCBtYW5pZmVzdFNSSSBmcm9tICd2aXRlLXBsdWdpbi1tYW5pZmVzdC1zcmknXG5pbXBvcnQgcmVzdGFydCBmcm9tICd2aXRlLXBsdWdpbi1yZXN0YXJ0J1xuaW1wb3J0IHZ1ZSBmcm9tICdAdml0ZWpzL3BsdWdpbi12dWUnXG5pbXBvcnQgeyB2aXRlQ29tbW9uanMgfSBmcm9tICdAb3JpZ2luanMvdml0ZS1wbHVnaW4tY29tbW9uanMnXG5pbXBvcnQgcG9zdGNzcyBmcm9tICcuL3Bvc3Rjc3MuY29uZmlnLmpzJ1xuaW1wb3J0IHBrZyBmcm9tICcuLi8uLi9wYWNrYWdlLmpzb24nXG5pbXBvcnQgKiBhcyBwYXRoIGZyb20gJ3BhdGgnXG5cbmNvbnN0IGJhbm5lckNvbnRlbnQgPSBgLyoqXG4gKiBuYW1lOiAke3BrZy5uYW1lfVxuICogdmVyc2lvbjogdiR7cGtnLnZlcnNpb259XG4gKiBkZXNjcmlwdGlvbjogJHtwa2cuZGVzY3JpcHRpb259XG4gKiBhdXRob3I6ICR7cGtnLmF1dGhvcn1cbiAqL2BcblxuLy8gaHR0cHM6Ly92aXRlanMuZGV2L2NvbmZpZy9cbmV4cG9ydCBkZWZhdWx0IGRlZmluZUNvbmZpZygoeyBjb21tYW5kIH0pID0+IHtcblx0cmV0dXJuIHtcblx0XHRiYXNlOiBjb21tYW5kID09PSAnc2VydmUnID8gJycgOiAnL2Rpc3QvJyxcblx0XHRidWlsZDoge1xuXHRcdFx0ZW1wdHlPdXREaXI6IHRydWUsXG5cdFx0XHRtYW5pZmVzdDogdHJ1ZSxcblx0XHRcdG91dERpcjogJy4vd2ViL2Rpc3QvJyxcblx0XHRcdHJvbGx1cE9wdGlvbnM6IHtcblx0XHRcdFx0aW5wdXQ6IHtcblx0XHRcdFx0XHRtYWluOiAnLi9zcmMvanMvbWFpbi5qcycsXG5cdFx0XHRcdH0sXG5cdFx0XHRcdG91dHB1dDoge1xuXHRcdFx0XHRcdHNvdXJjZW1hcDogdHJ1ZSxcblx0XHRcdFx0fSxcblx0XHRcdH0sXG5cdFx0fSxcblx0XHRjc3M6IHtcblx0XHRcdHBvc3Rjc3MsXG5cdFx0fSxcblx0XHRwbHVnaW5zOiBbXG5cdFx0XHRiYW5uZXIoYmFubmVyQ29udGVudCksXG5cdFx0XHRjb21wcmVzc2lvbih7XG5cdFx0XHRcdGZpbHRlcjogL1xcLihqc3xtanN8anNvbnxjc3N8bWFwKSQvaSxcblx0XHRcdH0pLFxuXHRcdFx0bGVnYWN5KHtcblx0XHRcdFx0dGFyZ2V0czogWydkZWZhdWx0cycsICdub3QgSUUgMTEnXSxcblx0XHRcdH0pLFxuXHRcdFx0bWFuaWZlc3RTUkkoKSxcblx0XHRcdHJlc3RhcnQoe1xuXHRcdFx0XHRyZWxvYWQ6IFsnLi9zcmMvdGVtcGxhdGVzLyoqLyonXSxcblx0XHRcdH0pLFxuXHRcdFx0dnVlKCksXG5cdFx0XHR2aXRlQ29tbW9uanMoKSxcblx0XHRdLFxuXHRcdHJlc29sdmU6IHtcblx0XHRcdGFsaWFzOiB7XG5cdFx0XHRcdCdAc3JjJzogcGF0aC5yZXNvbHZlKF9fZGlybmFtZSwgJy4uLy4uL3NyYycpLFxuXHRcdFx0XHQnQGJ1aWxkJzogcGF0aC5yZXNvbHZlKF9fZGlybmFtZSwgJy4nKSxcblx0XHRcdFx0J3Z1ZSc6ICd2dWUvZGlzdC92dWUuZXNtLWJ1bmRsZXIuanMnLFxuXHRcdFx0fSxcblx0XHRcdHByZXNlcnZlU3ltbGlua3M6IHRydWUsXG5cdFx0fSxcblx0XHRzZXJ2ZXI6IHtcblx0XHRcdGhvc3Q6IHRydWUsXG5cdFx0XHRwb3J0OiA4MDgwLFxuXHRcdFx0c3RyaWN0UG9ydDogdHJ1ZSxcblx0XHRcdHdhdGNoOiB7XG5cdFx0XHRcdGlnbm9yZWQ6IFsnKiovc3RvcmFnZS8qKicsICcqKi92ZW5kb3IvKionLCAnKiovd2ViL2NwcmVzb3VyY2VzLyoqJ10sXG5cdFx0XHR9LFxuXHRcdFx0Y29yczogdHJ1ZSxcblx0XHR9LFxuXHR9XG59KVxuIiwgImNvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9kaXJuYW1lID0gXCIvVXNlcnMvYnRidW56ZS9Eb2N1bWVudHMvU3RlYWRmYXN0L2NhcmJvbi9jb25maWcvYnVpbGRcIjtjb25zdCBfX3ZpdGVfaW5qZWN0ZWRfb3JpZ2luYWxfZmlsZW5hbWUgPSBcIi9Vc2Vycy9idGJ1bnplL0RvY3VtZW50cy9TdGVhZGZhc3QvY2FyYm9uL2NvbmZpZy9idWlsZC9wb3N0Y3NzLmNvbmZpZy5qc1wiO2NvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9pbXBvcnRfbWV0YV91cmwgPSBcImZpbGU6Ly8vVXNlcnMvYnRidW56ZS9Eb2N1bWVudHMvU3RlYWRmYXN0L2NhcmJvbi9jb25maWcvYnVpbGQvcG9zdGNzcy5jb25maWcuanNcIjtpbXBvcnQgcG9zdGNzc0ltcG9ydCBmcm9tICdwb3N0Y3NzLWltcG9ydCdcbmltcG9ydCB0YWlsd2luZGNzc05lc3RpbmcgZnJvbSAndGFpbHdpbmRjc3MvbmVzdGluZydcbmltcG9ydCB0YWlsd2luZGNzcyBmcm9tICd0YWlsd2luZGNzcydcbmltcG9ydCB0YWlsd2luZGNzc0NvbmZpZyBmcm9tICcuL3RhaWx3aW5kLmNvbmZpZy5tanMnXG5pbXBvcnQgYXV0b3ByZWZpeGVyIGZyb20gJ2F1dG9wcmVmaXhlcidcblxuZXhwb3J0IGRlZmF1bHQge1xuXHRwbHVnaW5zOiBbXG5cdFx0cG9zdGNzc0ltcG9ydCxcblx0XHR0YWlsd2luZGNzc05lc3RpbmcsXG5cdFx0dGFpbHdpbmRjc3Moe1xuXHRcdFx0Y29uZmlnOiB0YWlsd2luZGNzc0NvbmZpZyxcblx0XHR9KSxcblx0XHRhdXRvcHJlZml4ZXIsXG5cdF0sXG59XG4iLCAiY29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2Rpcm5hbWUgPSBcIi9Vc2Vycy9idGJ1bnplL0RvY3VtZW50cy9TdGVhZGZhc3QvY2FyYm9uXCI7Y29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2ZpbGVuYW1lID0gXCIvVXNlcnMvYnRidW56ZS9Eb2N1bWVudHMvU3RlYWRmYXN0L2NhcmJvbi9nZXRBZG9iZU1ldHJpY3MubWpzXCI7Y29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2ltcG9ydF9tZXRhX3VybCA9IFwiZmlsZTovLy9Vc2Vycy9idGJ1bnplL0RvY3VtZW50cy9TdGVhZGZhc3QvY2FyYm9uL2dldEFkb2JlTWV0cmljcy5tanNcIjtpbXBvcnQgeyBmcm9tQnVmZmVyIH0gZnJvbSAnQGNhcHNpemVjc3MvdW5wYWNrJztcblxuZXhwb3J0IGRlZmF1bHQgYXN5bmMgZnVuY3Rpb24gZ2V0QWRvYmVNZXRyaWNzKGFkb2JlVXJsKSB7XG4gICAgaWYgKCFhZG9iZVVybCkge1xuICAgICAgICBjb25zb2xlLmVycm9yKCdQbGVhc2UgcHJvdmlkZSBhIFVSTCcpO1xuICAgICAgICBwcm9jZXNzLmV4aXQoMSk7XG4gICAgfVxuXG4gICAgYXN5bmMgZnVuY3Rpb24gZ2V0TWV0cmljcyh1cmwpIHtcbiAgICAgICAgY29uc3QgZm9udEJ1ZmZlciA9IGF3YWl0IGZldGNoKHVybCkudGhlbihyZXMgPT4gcmVzLmFycmF5QnVmZmVyKCkpO1xuICAgICAgICBjb25zdCBmb250TWV0cmljcyA9IGF3YWl0IGZyb21CdWZmZXIoZm9udEJ1ZmZlcik7XG4gICAgICAgIHJldHVybiBmb250TWV0cmljcztcbiAgICB9XG5cbiAgICBhc3luYyBmdW5jdGlvbiBwYXJzZVR5cGVraXRVcmwodXJsKSB7XG4gICAgICAgIGNvbnN0IGNzcyA9IGF3YWl0IGZldGNoKHVybCkudGhlbihyZXMgPT4gcmVzLnRleHQoKSk7XG4gICAgICAgIGNvbnN0IGRlY2xhcmF0aW9ucyA9IGNzcy5zcGxpdCgnQGZvbnQtZmFjZScpLnNsaWNlKDEpOyAvLyBSZW1vdmUgZmlyc3QgZW1wdHkgZWxlbWVudFxuICAgICAgICBcbiAgICAgICAgY29uc3Qgc2VlbkZhbWlsaWVzID0gbmV3IFNldCgpO1xuICAgICAgICBjb25zdCBmaWx0ZXJlZERlY2xhcmF0aW9ucyA9IFtdO1xuICAgICAgICBcbiAgICAgICAgZm9yIChjb25zdCBkZWNsYXJhdGlvbiBvZiBkZWNsYXJhdGlvbnMpIHtcbiAgICAgICAgICAgIGNvbnN0IGZhbWlseU1hdGNoID0gZGVjbGFyYXRpb24ubWF0Y2goL2ZvbnQtZmFtaWx5OlxccypbJ1wiXShbXidcIl0rKVsnXCJdLyk7XG4gICAgICAgICAgICBpZiAoZmFtaWx5TWF0Y2gpIHtcbiAgICAgICAgICAgICAgICBjb25zdCBmb250RmFtaWx5ID0gZmFtaWx5TWF0Y2hbMV07XG4gICAgICAgICAgICAgICAgaWYgKCFzZWVuRmFtaWxpZXMuaGFzKGZvbnRGYW1pbHkpKSB7XG4gICAgICAgICAgICAgICAgICAgIHNlZW5GYW1pbGllcy5hZGQoZm9udEZhbWlseSk7XG4gICAgICAgICAgICAgICAgICAgIGZpbHRlcmVkRGVjbGFyYXRpb25zLnB1c2goe25hbWU6IGZvbnRGYW1pbHkudG9Mb3dlckNhc2UoKS5yZXBsYWNlKCcgJywgJy0nKSwgZGVjbGFyYXRpb259KTtcbiAgICAgICAgICAgICAgICB9XG4gICAgICAgICAgICB9XG4gICAgICAgIH1cbiAgICAgICAgY29uc3QgZm9udHMgPSBmaWx0ZXJlZERlY2xhcmF0aW9ucy5tYXAoZm9udCA9PiB7XG4gICAgICAgICAgICByZXR1cm4geyBuYW1lOiBmb250Lm5hbWUsIHVybDogZm9udC5kZWNsYXJhdGlvbi5tYXRjaCgvKD88PXVybFxcKFwiKSguKj8pKD89KFwiXFwpIGZvcm1hdFxcKFwid29mZjJcIlxcKSkpL2cpWzBdIH07XG4gICAgICAgIH0pO1xuICAgICAgICByZXR1cm4gZm9udHM7XG4gICAgfVxuXG4gICAgY29uc3QgZm9udHMgPSBhd2FpdCBwYXJzZVR5cGVraXRVcmwoYWRvYmVVcmwpO1xuXG4gICAgY29uc3QgZm9udE1ldHJpY3NBcnJheSA9IHt9O1xuXG4gICAgYXdhaXQgUHJvbWlzZS5hbGwoZm9udHMubWFwKGFzeW5jIGZvbnQgPT4ge1xuICAgICAgICBjb25zdCBtZXRyaWNzID0gYXdhaXQgZ2V0TWV0cmljcyhmb250LnVybCk7XG4gICAgICAgIGZvbnRNZXRyaWNzQXJyYXlbZm9udC5uYW1lXSA9IG1ldHJpY3M7XG4gICAgfSkpO1xuXG4gICAgcmV0dXJuIGZvbnRNZXRyaWNzQXJyYXk7XG59IiwgImNvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9kaXJuYW1lID0gXCIvVXNlcnMvYnRidW56ZS9Eb2N1bWVudHMvU3RlYWRmYXN0L2NhcmJvbi9jb25maWcvYnVpbGRcIjtjb25zdCBfX3ZpdGVfaW5qZWN0ZWRfb3JpZ2luYWxfZmlsZW5hbWUgPSBcIi9Vc2Vycy9idGJ1bnplL0RvY3VtZW50cy9TdGVhZGZhc3QvY2FyYm9uL2NvbmZpZy9idWlsZC9jYXJib24ubWpzXCI7Y29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2ltcG9ydF9tZXRhX3VybCA9IFwiZmlsZTovLy9Vc2Vycy9idGJ1bnplL0RvY3VtZW50cy9TdGVhZGZhc3QvY2FyYm9uL2NvbmZpZy9idWlsZC9jYXJib24ubWpzXCI7aW1wb3J0IGdldEFkb2JlTWV0cmljcyBmcm9tICcuLi8uLi9nZXRBZG9iZU1ldHJpY3MubWpzJ1xuXG5leHBvcnQgY29uc3QgY29sb3JzID0ge1xuXHR3aGl0ZTogJyNmZmZmZmYnLFxuXHRibGFjazogJyMwMDAwMDAnLFxuXG5cdC8vIERlZmF1bHQgVGFpbHdpbmQgY29sb3JzXG5cdGdyYXk6IHtcblx0XHQ1MDogJyNmOWZhZmInLFxuXHRcdDEwMDogJyNmM2Y0ZjYnLFxuXHRcdDIwMDogJyNlNWU3ZWInLFxuXHRcdDMwMDogJyNkMWQ1ZGInLFxuXHRcdDQwMDogJyM5Y2EzYWYnLFxuXHRcdDUwMDogJyM2YjcyODAnLFxuXHRcdDYwMDogJyM0YjU1NjMnLFxuXHRcdDcwMDogJyMzNzQxNTEnLFxuXHRcdDgwMDogJyMxZjI5MzcnLFxuXHRcdDkwMDogJyMxMTE4MjcnLFxuXHR9LFxuXHRibHVlOiB7XG5cdFx0NTA6ICcjZWZmNmZmJyxcblx0XHQxMDA6ICcjZGJlYWZlJyxcblx0XHQyMDA6ICcjYmZkYmZlJyxcblx0XHQzMDA6ICcjOTNjNWZkJyxcblx0XHQ0MDA6ICcjNjBhNWZhJyxcblx0XHQ1MDA6ICcjM2I4MmY2Jyxcblx0XHQ2MDA6ICcjMjU2M2ViJyxcblx0XHQ3MDA6ICcjMWQ0ZWQ4Jyxcblx0XHQ4MDA6ICcjMWU0MGFmJyxcblx0XHQ5MDA6ICcjMWUzYThhJyxcblx0fSxcbn1cblxuZXhwb3J0IGNvbnN0IGljb25zID0ge1xuXHQvLyBFeGFtcGxlIGljb24gc2l6ZVxuXHQxMjogeyBhYmJyOiAnMTInLCBzaXplOiAnMTJweCcsIGZvbGRlcjogJzEyJyB9LFxufVxuXG5leHBvcnQgY29uc3Qgc2hhZG93cyA9IHtcblx0Ly8gRXhhbXBsZSBzaGFkb3dcblx0Y2FyZDogJzBweCA0cHggMjRweCAycHggcmdiYSgxNywgNzIsIDEwMiwgLjA4KScsXG59XG5cbmV4cG9ydCBjb25zdCB0eXBvZ3JhcGh5ID0ge1xuXHRmb250czogXHR7XG5cdFx0XCJhcmVhLW5vcm1hbFwiOiB7XG5cdFx0XHRmYW1pbHk6IFtcblx0XHRcdFx0XCJBcmVhIE5vcm1hbCBCbGFja1wiLFxuXHRcdFx0XHRcInNhbnMtc2VyaWZcIlxuXHRcdFx0XSxcblx0XHRcdG1ldHJpY3M6IHtcblx0XHRcdFx0ZmFtaWx5TmFtZTogJ0FyZWEgTm9ybWFsIEJsYWNrJyxcblx0XHRcdFx0ZnVsbE5hbWU6ICdBcmVhIE5vcm1hbCBCbGFjaycsXG5cdFx0XHRcdHBvc3RzY3JpcHROYW1lOiAnQXJlYU5vcm1hbC1CbGFja0l0YWxpYycsXG5cdFx0XHRcdGNhcEhlaWdodDogNzgwLFxuXHRcdFx0XHRhc2NlbnQ6IDEzMDAsXG5cdFx0XHRcdGRlc2NlbnQ6IC0zNDAsXG5cdFx0XHRcdGxpbmVHYXA6IDAsXG5cdFx0XHRcdHVuaXRzUGVyRW06IDEwMDAsXG5cdFx0XHRcdHhIZWlnaHQ6IDU1OCxcblx0XHRcdFx0eFdpZHRoQXZnOiA1MDcsXG5cdFx0XHRcdHN1YnNldHM6IHtcblx0XHRcdFx0XHRsYXRpbjoge1xuXHRcdFx0XHRcdFx0eFdpZHRoQXZnOiA1MDdcblx0XHRcdFx0XHR9LFxuXHRcdFx0XHRcdHRoYWk6IHtcblx0XHRcdFx0XHRcdHhXaWR0aEF2ZzogODY2XG5cdFx0XHRcdFx0fVxuXHRcdFx0XHR9XG5cdFx0XHR9XG5cdFx0fSxcblx0XHRcImFyZWEtbm9ybWFsLWxpZ2h0XCI6IHtcblx0XHRcdGZhbWlseTogW1xuXHRcdFx0XHRcIkFyZWEgTm9ybWFsIEV4dHJhbGlnaHRcIixcblx0XHRcdFx0XCJzYW5zLXNlcmlmXCJcblx0XHRcdF0sXG5cdFx0XHRtZXRyaWNzOiB7XG5cdFx0XHRcdGZhbWlseU5hbWU6ICdBcmVhIE5vcm1hbCBFeHRyYWxpZ2h0Jyxcblx0XHRcdFx0ZnVsbE5hbWU6ICdBcmVhIE5vcm1hbCBFeHRyYWxpZ2h0Jyxcblx0XHRcdFx0cG9zdHNjcmlwdE5hbWU6ICdBcmVhTm9ybWFsLUV4dHJhbGlnaHRJdGFsaWMnLFxuXHRcdFx0XHRjYXBIZWlnaHQ6IDc4MCxcblx0XHRcdFx0YXNjZW50OiAxMjYzLFxuXHRcdFx0XHRkZXNjZW50OiAtMjQ4LFxuXHRcdFx0XHRsaW5lR2FwOiAwLFxuXHRcdFx0XHR1bml0c1BlckVtOiAxMDAwLFxuXHRcdFx0XHR4SGVpZ2h0OiA1NTEsXG5cdFx0XHRcdHhXaWR0aEF2ZzogNDk0LFxuXHRcdFx0XHRzdWJzZXRzOiB7XG5cdFx0XHRcdFx0bGF0aW46IHtcblx0XHRcdFx0XHRcdHhXaWR0aEF2ZzogNDk0XG5cdFx0XHRcdFx0fSxcblx0XHRcdFx0XHR0aGFpOiB7XG5cdFx0XHRcdFx0XHR4V2lkdGhBdmc6IDg2NVxuXHRcdFx0XHRcdH1cblx0XHRcdFx0fVxuXHRcdFx0fVxuXHRcdH0sXG5cdFx0XCJpbnRlci12YXJpYWJsZVwiOiB7XG5cdFx0XHRmYW1pbHk6IFtcblx0XHRcdFx0XCJJbnRlclwiLFxuXHRcdFx0XHRcInNhbnMtc2VyaWZcIlxuXHRcdFx0XSxcblx0XHRcdG1ldHJpY3M6IHtcblx0XHRcdFx0ZmFtaWx5TmFtZTogJ0ludGVyJyxcblx0XHRcdFx0ZnVsbE5hbWU6ICdJbnRlcicsXG5cdFx0XHRcdHBvc3RzY3JpcHROYW1lOiAnSW50ZXItUmVndWxhcicsXG5cdFx0XHRcdGNhcEhlaWdodDogMjA0OCxcblx0XHRcdFx0YXNjZW50OiAzMDcyLFxuXHRcdFx0XHRkZXNjZW50OiAtOTAwLFxuXHRcdFx0XHRsaW5lR2FwOiAwLFxuXHRcdFx0XHR1bml0c1BlckVtOiAyODE2LFxuXHRcdFx0XHR4SGVpZ2h0OiAxNTM2LFxuXHRcdFx0XHR4V2lkdGhBdmc6IDEzNDQsXG5cdFx0XHRcdHN1YnNldHM6IHtcblx0XHRcdFx0XHRsYXRpbjoge1xuXHRcdFx0XHRcdFx0eFdpZHRoQXZnOiAxMzQ0XG5cdFx0XHRcdFx0fSxcblx0XHRcdFx0XHR0aGFpOiB7XG5cdFx0XHRcdFx0XHR4V2lkdGhBdmc6IDI4MDBcblx0XHRcdFx0XHR9XG5cdFx0XHRcdH1cblx0XHRcdH1cblx0XHR9XG5cdH0sXG5cblx0c3R5bGVzOiB7XG5cdFx0Ly8gVHlwb2dyYXBoeSBzdHlsZXNcblx0XHRoMToge1xuXHRcdFx0Zm9udEZhbWlseTogJ2ludGVyLXZhcmlhYmxlJyxcblx0XHRcdGZvbnRXZWlnaHQ6ICdib2xkJyxcblx0XHRcdGZvbnRTaXplOiB7IGJhc2U6ICc0MCcsIG1kOiAnNTInIH0sXG5cdFx0XHRsaW5lSGVpZ2h0OiB7IGJhc2U6ICcxMzAnIH0sXG5cdFx0XHRsZXR0ZXJTcGFjaW5nOiAnLTAyNScsXG5cdFx0XHR1cHBlcmNhc2U6IGZhbHNlLFxuXHRcdFx0c3BhY2luZzoge1xuXHRcdFx0XHQnaDEnOiB7IGJhc2U6ICdzOScsIG1kOiAnczknIH0sXG5cdFx0XHRcdCdoMic6IHsgYmFzZTogJ3MxMCcsIG1kOiAnczknIH0sXG5cdFx0XHRcdCdwJzogeyBiYXNlOiAnczEwJywgbWQ6ICdzMTInIH0sXG5cdFx0XHRcdCdwLXNtJzogeyBiYXNlOiAnczEwJywgbWQ6ICdzMTInIH0sXG5cdFx0XHRcdCdsaXN0JzogeyBiYXNlOiAnczEwJywgbWQ6ICdzMTInIH0sXG5cdFx0XHR9LFxuXHRcdH0sXG5cdFx0aDI6IHtcblx0XHRcdGZvbnRGYW1pbHk6ICdpbnRlci12YXJpYWJsZScsXG5cdFx0XHRmb250V2VpZ2h0OiAnYm9sZCcsXG5cdFx0XHRmb250U2l6ZTogeyBiYXNlOiAnMzInLCBtZDogJzQwJyB9LFxuXHRcdFx0bGluZUhlaWdodDogeyBiYXNlOiAnMTMwJyB9LFxuXHRcdFx0bGV0dGVyU3BhY2luZzogJy0wMjUnLFxuXHRcdFx0dXBwZXJjYXNlOiBmYWxzZSxcblx0XHR9LFxuXHRcdGgzOiB7XG5cdFx0XHRmb250RmFtaWx5OiAnYXJlYS1ub3JtYWwnLFxuXHRcdFx0Zm9udFdlaWdodDogJ2JvbGQnLFxuXHRcdFx0Zm9udFNpemU6IHsgYmFzZTogJzI0JywgbWQ6ICczMicgfSxcblx0XHRcdGxpbmVIZWlnaHQ6IHsgYmFzZTogJzEzMCcgfSxcblx0XHRcdGxldHRlclNwYWNpbmc6ICcwJyxcblx0XHRcdHVwcGVyY2FzZTogZmFsc2UsXG5cdFx0fSxcblx0XHRoNDoge1xuXHRcdFx0Zm9udEZhbWlseTogJ2FyZWEtbm9ybWFsJyxcblx0XHRcdGZvbnRXZWlnaHQ6ICdib2xkJyxcblx0XHRcdGZvbnRTaXplOiB7IGJhc2U6ICcyMCcsIG1kOiAnMjQnIH0sXG5cdFx0XHRsaW5lSGVpZ2h0OiB7IGJhc2U6ICcxMzAnIH0sXG5cdFx0XHRsZXR0ZXJTcGFjaW5nOiAnMCcsXG5cdFx0XHR1cHBlcmNhc2U6IHRydWUsXG5cdFx0fSxcblx0XHRwOiB7XG5cdFx0XHRmb250RmFtaWx5OiAnYXJlYS1ub3JtYWwnLFxuXHRcdFx0Zm9udFdlaWdodDogJ25vcm1hbCcsXG5cdFx0XHRmb250U2l6ZTogeyBiYXNlOiAnMTYnLCBtZDogJzE4JyB9LFxuXHRcdFx0bGluZUhlaWdodDogeyBiYXNlOiAnMTYwJyB9LFxuXHRcdFx0bGV0dGVyU3BhY2luZzogJzAnLFxuXHRcdFx0dXBwZXJjYXNlOiBmYWxzZSxcblx0XHR9LFxuXHRcdCdwLXNtJzoge1xuXHRcdFx0Zm9udEZhbWlseTogJ2FyZWEtbm9ybWFsJyxcblx0XHRcdGZvbnRXZWlnaHQ6ICdub3JtYWwnLFxuXHRcdFx0Zm9udFNpemU6IHsgYmFzZTogJzE0JywgbWQ6ICcxNicgfSxcblx0XHRcdGxpbmVIZWlnaHQ6IHsgYmFzZTogJzE2MCcgfSxcblx0XHRcdGxldHRlclNwYWNpbmc6ICcwJyxcblx0XHRcdHVwcGVyY2FzZTogZmFsc2UsXG5cdFx0fSxcblx0fSxcbn1cbiIsICJjb25zdCBfX3ZpdGVfaW5qZWN0ZWRfb3JpZ2luYWxfZGlybmFtZSA9IFwiL1VzZXJzL2J0YnVuemUvRG9jdW1lbnRzL1N0ZWFkZmFzdC9jYXJib24vY29uZmlnL2J1aWxkL3BsdWdpbnNcIjtjb25zdCBfX3ZpdGVfaW5qZWN0ZWRfb3JpZ2luYWxfZmlsZW5hbWUgPSBcIi9Vc2Vycy9idGJ1bnplL0RvY3VtZW50cy9TdGVhZGZhc3QvY2FyYm9uL2NvbmZpZy9idWlsZC9wbHVnaW5zL2ludGVyYWN0Lm1qc1wiO2NvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9pbXBvcnRfbWV0YV91cmwgPSBcImZpbGU6Ly8vVXNlcnMvYnRidW56ZS9Eb2N1bWVudHMvU3RlYWRmYXN0L2NhcmJvbi9jb25maWcvYnVpbGQvcGx1Z2lucy9pbnRlcmFjdC5tanNcIjtleHBvcnQgZnVuY3Rpb24gaW50ZXJhY3RWYXJpYW50UGx1Z2luKHsgYWRkVmFyaWFudCB9KSB7XG5cdC8vIEFkZHMgaW50ZXJhY3QgdmFyaWFudCB0aGF0IGFkZHMgYWxsIG9mIHRoZSBob3Zlci9mb2N1cyBzdGF0ZXMgaW4gb25lIGNsYXNzXG5cdGFkZFZhcmlhbnQoJ2ludGVyYWN0JywgWycmOmhvdmVyJywgJyY6Zm9jdXMnLCAnJjphY3RpdmUnLCAnJjpmb2N1cy13aXRoaW4nXSksXG5cdFx0Ly8gR3JvdXAgdmFyaWFudCB0byBhbGxvdyBmb3IgaW50ZXJhY3Qgc3RhdGUgYmFzZWQgb24gcGFyZW50IGhvdmVyXG5cdFx0YWRkVmFyaWFudCgnZ3JvdXAtaW50ZXJhY3QnLCBbXG5cdFx0XHQnOm1lcmdlKC5ncm91cCk6aG92ZXIgJicsXG5cdFx0XHQnOm1lcmdlKC5ncm91cCk6Zm9jdXMgJicsXG5cdFx0XHQnOm1lcmdlKC5ncm91cCk6Zm9jdXMtd2l0aGluICYnLFxuXHRcdFx0JzptZXJnZSguZ3JvdXApOmFjdGl2ZSAmJyxcblx0XHRdKVxufVxuIiwgImNvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9kaXJuYW1lID0gXCIvVXNlcnMvYnRidW56ZS9Eb2N1bWVudHMvU3RlYWRmYXN0L2NhcmJvbi9jb25maWcvYnVpbGQvcGx1Z2luc1wiO2NvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9maWxlbmFtZSA9IFwiL1VzZXJzL2J0YnVuemUvRG9jdW1lbnRzL1N0ZWFkZmFzdC9jYXJib24vY29uZmlnL2J1aWxkL3BsdWdpbnMvdHlwb2dyYXBoeS5tanNcIjtjb25zdCBfX3ZpdGVfaW5qZWN0ZWRfb3JpZ2luYWxfaW1wb3J0X21ldGFfdXJsID0gXCJmaWxlOi8vL1VzZXJzL2J0YnVuemUvRG9jdW1lbnRzL1N0ZWFkZmFzdC9jYXJib24vY29uZmlnL2J1aWxkL3BsdWdpbnMvdHlwb2dyYXBoeS5tanNcIjtpbXBvcnQgdGFpbHdpbmRjc3NQbHVnaW4gZnJvbSAndGFpbHdpbmRjc3MvcGx1Z2luJ1xuaW1wb3J0IHsgY29sb3JzLCB0eXBvZ3JhcGh5IH0gZnJvbSAnLi4vY2FyYm9uLm1qcydcbmltcG9ydCB7IGNyZWF0ZVN0eWxlT2JqZWN0IH0gZnJvbSAnQGNhcHNpemVjc3MvY29yZSdcblxuY29uc3QgdHlwb2dyYXBoeUVsZW1lbnRzID0gT2JqZWN0LmtleXModHlwb2dyYXBoeS5zdHlsZXMpLnJlZHVjZSgoYWNjLCBjdXJyKSA9PiB7XG5cdHJldHVybiBbJ2gxJywgJ2gyJywgJ2gzJywgJ2g0JywgJ2g1JywgJ2g2JywgJ3AnXS5pbmNsdWRlcyhjdXJyKVxuXHRcdD8geyAuLi5hY2MsIFtjdXJyXTogW2AudC0ke2N1cnJ9YCwgYCR7Y3Vycn06bm90KFtjbGFzc149J3QtJ10pOm5vdChbY2xhc3MqPScgdC0nXSlgXSB9XG5cdFx0OiB7IC4uLmFjYywgW2N1cnJdOiBbYC50LSR7Y3Vycn1gXSB9XG59LCB7fSlcblxubGV0IHJ1bGVTZXRzQnlTY3JlZW4gPSB7fVxuXG5jb25zdCBnZW5lcmF0ZUlzID0gKHNlbGVjdG9ycykgPT4ge1xuXHRpZiAoQXJyYXkuaXNBcnJheShzZWxlY3RvcnMpKSB7XG5cdFx0cmV0dXJuICc6aXMoJyArIHNlbGVjdG9ycy5qb2luKCcsICcpICsgJyknXG5cdH1cblx0cmV0dXJuIHNlbGVjdG9yc1xufVxuXG5jb25zdCBnZXRTY3JlZW5TaXplID0gKHNjcmVlbiwgdGhlbWUpID0+IHtcblx0cmV0dXJuIHNjcmVlbiA9PT0gJ2Jhc2UnXG5cdFx0PyAnYmFzZSdcblx0XHQ6IHRoZW1lKCdzY3JlZW5zLicgKyBzY3JlZW4pLnJlcGxhY2UoJ3B4JywgJycpXG59XG5cbmNvbnN0IGdldE1ldHJpY3MgPSAoZmFtaWx5KSA9PiB7XG5cdHJldHVybiB0eXBvZ3JhcGh5LmZvbnRzW2ZhbWlseV0ubWV0cmljc1xufVxuXG5jb25zdCBnZW5lcmF0ZVJ1bGVTZXRzQnlTY3JlZW4gPSAoc2NyZWVuU2l6ZSwgc2VsZWN0b3IsIHJ1bGVzKSA9PiB7XG5cdHJ1bGVTZXRzQnlTY3JlZW5bc2NyZWVuU2l6ZV0gPSB7XG5cdFx0Li4ucnVsZVNldHNCeVNjcmVlbltzY3JlZW5TaXplXSxcblx0XHRbc2VsZWN0b3JdOiB7XG5cdFx0XHQuLi4ocnVsZVNldHNCeVNjcmVlbltzY3JlZW5TaXplXSAmJiB7XG5cdFx0XHRcdC4uLnJ1bGVTZXRzQnlTY3JlZW5bc2NyZWVuU2l6ZV1bc2VsZWN0b3JdLFxuXHRcdFx0fSksXG5cdFx0XHQuLi5ydWxlcyxcblx0XHR9LFxuXHR9XG59XG5cbmNvbnN0IGdlbmVyYXRlQ2Fwc2l6ZVN0eWxlcyA9IChzZXR0aW5ncywgZm9udFNpemUsIGxpbmVIZWlnaHQpID0+IHtcblx0aWYgKCFzZXR0aW5ncy5mb250RmFtaWx5IHx8ICFmb250U2l6ZSB8fCAhbGluZUhlaWdodCkge1xuXHRcdHJldHVybiB7fVxuXHR9XG5cblx0Y29uc29sZS5sb2coc2V0dGluZ3MpXG5cdFxuXHRjb25zdCBtZXRyaWNzID0gZ2V0TWV0cmljcyhzZXR0aW5ncy5mb250RmFtaWx5KVxuXG5cdGNvbnN0IGNhcEhlaWdodCA9IHBhcnNlSW50KGZvbnRTaXplKVxuXHRjb25zdCBwaXhlbExpbmVIZWlnaHQgPSBwYXJzZUludChmb250U2l6ZSkgKiAocGFyc2VJbnQobGluZUhlaWdodCkgLyAxMDApXG5cdGNvbnN0IGxpbmVHYXAgPSBwaXhlbExpbmVIZWlnaHQgLSBjYXBIZWlnaHRcblx0XG5cdGNvbnN0IHNob3VsZFVzZU1pZENhcCA9ICFzZXR0aW5ncy51cHBlcmNhc2Vcblx0XG5cdGlmIChzaG91bGRVc2VNaWRDYXApIHtcblx0XHQvLyBEaWZmZXJlbmNlIGJldHdlZW4gY2FwIHBvc2l0aW9uIGFuZCBtaWQtY2FwIHBvc2l0aW9uXG5cdFx0Y29uc3QgbWlkQ2FwRGlmZiA9IChtZXRyaWNzLmNhcEhlaWdodCAtIG1ldHJpY3MueEhlaWdodCkgLyAyXG5cdFx0XG5cdFx0Ly8gR2VuZXJhdGUgYmFzZSBDYXBzaXplIHN0eWxlc1xuXHRcdGNvbnN0IGJhc2VTdHlsZXMgPSBjcmVhdGVTdHlsZU9iamVjdCh7XG5cdFx0XHRjYXBIZWlnaHQ6IGNhcEhlaWdodCxcblx0XHRcdGxpbmVHYXA6IGxpbmVHYXAsXG5cdFx0XHRmb250TWV0cmljczogbWV0cmljcyxcblx0XHR9KVxuXG5cdFx0Y29uc29sZS5sb2coc2V0dGluZ3MuZm9udEZhbWlseSwgYmFzZVN0eWxlcylcblx0XHRcblx0XHQvLyBBZGp1c3QgdGhlIDo6YmVmb3JlIHBzZXVkby1lbGVtZW50IGZvciBtaWQtY2FwIHRyaW1taW5nXG5cdFx0aWYgKGJhc2VTdHlsZXNbJzo6YmVmb3JlJ10pIHtcblx0XHRcdGNvbnN0IG9yaWdpbmFsTWFyZ2luID0gcGFyc2VGbG9hdChiYXNlU3R5bGVzWyc6OmJlZm9yZSddLm1hcmdpbkJvdHRvbSlcblx0XHRcdGJhc2VTdHlsZXNbJzo6YmVmb3JlJ10ubWFyZ2luQm90dG9tID0gYCR7b3JpZ2luYWxNYXJnaW4gLSAobWlkQ2FwRGlmZiAvIG1ldHJpY3MudW5pdHNQZXJFbSl9ZW1gXG5cdFx0fVxuXHRcdFx0XHRcblx0XHRyZXR1cm4gYmFzZVN0eWxlc1xuXHR9XG5cblx0Ly8gRm9yIHVwcGVyY2FzZSB0ZXh0LCB1c2Ugbm9ybWFsIGNhcCBoZWlnaHQgdHJpbW1pbmdcblx0cmV0dXJuIGNyZWF0ZVN0eWxlT2JqZWN0KHtcblx0XHRjYXBIZWlnaHQ6IGNhcEhlaWdodCxcblx0XHRsaW5lR2FwOiBsaW5lR2FwLFxuXHRcdGZvbnRNZXRyaWNzOiBtZXRyaWNzLFxuXHR9KVxufVxuXG5leHBvcnQgY29uc3QgdHlwb2dyYXBoeUVsZW1lbnRzTGlzdCA9IE9iamVjdC52YWx1ZXModHlwb2dyYXBoeUVsZW1lbnRzKS5mbGF0KClcblxuZXhwb3J0IGNvbnN0IHR5cG9ncmFwaHlQbHVnaW4gPSB0YWlsd2luZGNzc1BsdWdpbihmdW5jdGlvbiAoeyBhZGRCYXNlLCB0aGVtZSB9KSB7XG5cdC8vIHNoXG5cdGlmICh0eXBvZ3JhcGh5LnN0eWxlcykge1xuXHRcdE9iamVjdC5lbnRyaWVzKHR5cG9ncmFwaHkuc3R5bGVzKS5mb3JFYWNoKChbZWxlbWVudCwgc2V0dGluZ3NdKSA9PiB7XG5cdFx0XHQvLyBoYW5kbGUgcm9vdC1sZXZlbCBzdHlsZXNcblx0XHRcdGNvbnN0IHNlbGVjdG9yID0gZ2VuZXJhdGVJcyh0eXBvZ3JhcGh5RWxlbWVudHNbZWxlbWVudF0pXG5cdFx0XHRjb25zdCBiYXNlU3R5bGVzID0ge1xuXHRcdFx0XHQuLi4oc2V0dGluZ3MuZm9udEZhbWlseSAmJiB7XG5cdFx0XHRcdFx0Zm9udEZhbWlseTogdGhlbWUoJ2ZvbnRGYW1pbHkuJyArIHNldHRpbmdzLmZvbnRGYW1pbHkpLFxuXHRcdFx0XHR9KSxcblx0XHRcdFx0Li4uKHNldHRpbmdzLmZvbnRXZWlnaHQgJiYge1xuXHRcdFx0XHRcdGZvbnRXZWlnaHQ6IHRoZW1lKCdmb250V2VpZ2h0LicgKyBzZXR0aW5ncy5mb250V2VpZ2h0KSxcblx0XHRcdFx0fSksXG5cdFx0XHRcdC4uLihzZXR0aW5ncy5sZXR0ZXJTcGFjaW5nICYmIHtcblx0XHRcdFx0XHRsZXR0ZXJTcGFjaW5nOiB0aGVtZSgnbGV0dGVyU3BhY2luZy4nICsgc2V0dGluZ3MubGV0dGVyU3BhY2luZyksXG5cdFx0XHRcdH0pLFxuXHRcdFx0XHQuLi4oc2V0dGluZ3MudXBwZXJjYXNlICYmIHsgdGV4dFRyYW5zZm9ybTogJ3VwcGVyY2FzZScgfSksXG5cdFx0XHR9XG5cdFx0XHRcblx0XHRcdGdlbmVyYXRlUnVsZVNldHNCeVNjcmVlbignYmFzZScsIHNlbGVjdG9yLCBiYXNlU3R5bGVzKVxuXG5cdFx0XHQvLyBoYW5kbGUgdGV4dCBjb2xvclxuXHRcdFx0aWYgKHNldHRpbmdzLnRleHRDb2xvcikge1xuXHRcdFx0XHRsZXQgW25hbWUsIHNoYWRlXSA9IHNldHRpbmdzLnRleHRDb2xvci5zcGxpdCgnLScpXG5cdFx0XHRcdGdlbmVyYXRlUnVsZVNldHNCeVNjcmVlbignYmFzZScsIHNlbGVjdG9yLCB7XG5cdFx0XHRcdFx0Y29sb3I6IGNvbG9yc1tuYW1lXVtzaGFkZV0sXG5cdFx0XHRcdH0pXG5cdFx0XHR9XG5cblx0XHRcdC8vIGhhbmRsZSBmb250IHNpemVzIGFuZCBsaW5lIGhlaWdodHMgd2l0aCBDYXBzaXplXG5cdFx0XHRpZiAoc2V0dGluZ3MuZm9udFNpemUgJiYgc2V0dGluZ3MubGluZUhlaWdodCkge1xuXHRcdFx0XHQvLyBHZXQgYWxsIHVuaXF1ZSBzY3JlZW5zIGZyb20gZm9udFNpemUgYW5kIGxpbmVIZWlnaHRcblx0XHRcdFx0Y29uc3Qgc2NyZWVucyA9IG5ldyBTZXQoW1xuXHRcdFx0XHRcdC4uLk9iamVjdC5rZXlzKHNldHRpbmdzLmZvbnRTaXplKSxcblx0XHRcdFx0XHQuLi5PYmplY3Qua2V5cyhzZXR0aW5ncy5saW5lSGVpZ2h0KVxuXHRcdFx0XHRdKVxuXHRcdFx0XHRcblx0XHRcdFx0c2NyZWVucy5mb3JFYWNoKHNjcmVlbiA9PiB7XG5cdFx0XHRcdFx0Y29uc3QgZm9udFNpemUgPSBzZXR0aW5ncy5mb250U2l6ZVtzY3JlZW5dIHx8IHNldHRpbmdzLmZvbnRTaXplLmJhc2Vcblx0XHRcdFx0XHRjb25zdCBsaW5lSGVpZ2h0ID0gc2V0dGluZ3MubGluZUhlaWdodFtzY3JlZW5dIHx8IHNldHRpbmdzLmxpbmVIZWlnaHQuYmFzZVxuXHRcdFx0XHRcdGNvbnN0IHNjcmVlblNpemUgPSBnZXRTY3JlZW5TaXplKHNjcmVlbiwgdGhlbWUpXG5cdFx0XHRcdFx0XG5cdFx0XHRcdFx0aWYgKGZvbnRTaXplICYmIGxpbmVIZWlnaHQpIHtcblx0XHRcdFx0XHRcdC8vIEdlbmVyYXRlIENhcHNpemUgc3R5bGVzXG5cdFx0XHRcdFx0XHRjb25zdCBjYXBzaXplU3R5bGVzID0gZ2VuZXJhdGVDYXBzaXplU3R5bGVzKFxuXHRcdFx0XHRcdFx0XHR7IC4uLnNldHRpbmdzLCBlbGVtZW50IH0sIFxuXHRcdFx0XHRcdFx0XHRmb250U2l6ZSwgXG5cdFx0XHRcdFx0XHRcdGxpbmVIZWlnaHRcblx0XHRcdFx0XHRcdClcblx0XHRcdFx0XHRcdFxuXHRcdFx0XHRcdFx0Ly8gQXBwbHkgQ2Fwc2l6ZSBzdHlsZXMgKHdoaWNoIGluY2x1ZGVzIGZvbnQgc2l6ZSBhbmQgbGluZSBoZWlnaHQpXG5cdFx0XHRcdFx0XHRnZW5lcmF0ZVJ1bGVTZXRzQnlTY3JlZW4oc2NyZWVuU2l6ZSwgc2VsZWN0b3IsIGNhcHNpemVTdHlsZXMpXG5cdFx0XHRcdFx0XHRcblx0XHRcdFx0XHRcdC8vIEFwcGx5IHBzZXVkby1lbGVtZW50cyBzZXBhcmF0ZWx5IGlmIHRoZXkgZXhpc3Rcblx0XHRcdFx0XHRcdGlmIChjYXBzaXplU3R5bGVzWyc6OmJlZm9yZSddKSB7XG5cdFx0XHRcdFx0XHRcdGdlbmVyYXRlUnVsZVNldHNCeVNjcmVlbihzY3JlZW5TaXplLCBzZWxlY3RvciArICc6OmJlZm9yZScsIHtcblx0XHRcdFx0XHRcdFx0XHQuLi5jYXBzaXplU3R5bGVzWyc6OmJlZm9yZSddXG5cdFx0XHRcdFx0XHRcdH0pXG5cdFx0XHRcdFx0XHR9XG5cdFx0XHRcdFx0XHRcblx0XHRcdFx0XHRcdGlmIChjYXBzaXplU3R5bGVzWyc6OmFmdGVyJ10pIHtcblx0XHRcdFx0XHRcdFx0Z2VuZXJhdGVSdWxlU2V0c0J5U2NyZWVuKHNjcmVlblNpemUsIHNlbGVjdG9yICsgJzo6YWZ0ZXInLCB7XG5cdFx0XHRcdFx0XHRcdFx0Li4uY2Fwc2l6ZVN0eWxlc1snOjphZnRlciddXG5cdFx0XHRcdFx0XHRcdH0pXG5cdFx0XHRcdFx0XHR9XG5cdFx0XHRcdFx0fVxuXHRcdFx0XHR9KVxuXHRcdFx0fVxuXG5cdFx0XHQvLyBnZW5lcmF0ZSBjb21iaW5hdGlvbiBzZWxlY3RvcnMsIGUuZy4gc2ggKyBoMVxuXHRcdFx0aWYgKHNldHRpbmdzLnNwYWNpbmcpIHtcblx0XHRcdFx0T2JqZWN0LmVudHJpZXMoc2V0dGluZ3Muc3BhY2luZykuZm9yRWFjaCgoW2NvbWJvRWxlbWVudCwgc3BhY2Vyc10pID0+IHtcblx0XHRcdFx0XHRjb25zdCBjb21ib1NlbGVjdG9yID1cblx0XHRcdFx0XHRcdGdlbmVyYXRlSXModHlwb2dyYXBoeUVsZW1lbnRzW2NvbWJvRWxlbWVudF0pICsgJyArICcgKyBzZWxlY3RvclxuXG5cdFx0XHRcdFx0Ly8gaGFuZGxlIHNwYWNpbmcgYmV0d2VlbiBzaWJsaW5ncyAocmVzcG9uc2l2ZWx5KVxuXHRcdFx0XHRcdE9iamVjdC5lbnRyaWVzKHNwYWNlcnMpLmZvckVhY2goKFtzY3JlZW4sIHNwYWNlclNpemVdKSA9PiB7XG5cdFx0XHRcdFx0XHRjb25zdCBzY3JlZW5TaXplID0gZ2V0U2NyZWVuU2l6ZShzY3JlZW4sIHRoZW1lKVxuXHRcdFx0XHRcdFx0Z2VuZXJhdGVSdWxlU2V0c0J5U2NyZWVuKHNjcmVlblNpemUsIGNvbWJvU2VsZWN0b3IsIHtcblx0XHRcdFx0XHRcdFx0bWFyZ2luVG9wOiB0aGVtZSgnc3BhY2luZy4nICsgc3BhY2VyU2l6ZSksXG5cdFx0XHRcdFx0XHR9KVxuXHRcdFx0XHRcdH0pXG5cdFx0XHRcdH0pXG5cdFx0XHR9XG5cdFx0fSlcblx0fVxuXG5cdGNvbnN0IGFsbE1lZGlhU2NyZWVucyA9IE9iamVjdC5rZXlzKHJ1bGVTZXRzQnlTY3JlZW4pLmZpbHRlcihcblx0XHQoc2NyZWVuKSA9PiBzY3JlZW4gIT09ICdiYXNlJ1xuXHQpXG5cdGNvbnN0IHNvcnRlZE1lZGlhU2NyZWVucyA9IFsuLi5hbGxNZWRpYVNjcmVlbnNdLnNvcnQoXG5cdFx0KGEsIGIpID0+IHBhcnNlSW50KGEpIC0gcGFyc2VJbnQoYilcblx0KVxuXG5cdGNvbnN0IG1lZGlhUnVsZVNldHMgPSBzb3J0ZWRNZWRpYVNjcmVlbnMucmVkdWNlKFxuXHRcdChhY2MsIHNjcmVlbikgPT4gKHtcblx0XHRcdC4uLmFjYyxcblx0XHRcdFsnQG1lZGlhIChtaW4td2lkdGg6ICcgKyBzY3JlZW4gKyAncHgpJ106IHtcblx0XHRcdFx0Li4ucnVsZVNldHNCeVNjcmVlbltzY3JlZW5dLFxuXHRcdFx0fSxcblx0XHR9KSxcblx0XHR7fVxuXHQpXG5cblx0bGV0IHR5cG9ncmFwaHlSdWxlU2V0cyA9IHtcblx0XHQuLi5ydWxlU2V0c0J5U2NyZWVuLmJhc2UsXG5cdFx0Li4ubWVkaWFSdWxlU2V0cyxcblx0fVxuXG5cdGFkZEJhc2UodHlwb2dyYXBoeVJ1bGVTZXRzKVxufSkiLCAiY29uc3QgX192aXRlX2luamVjdGVkX29yaWdpbmFsX2Rpcm5hbWUgPSBcIi9Vc2Vycy9idGJ1bnplL0RvY3VtZW50cy9TdGVhZGZhc3QvY2FyYm9uL2NvbmZpZy9idWlsZFwiO2NvbnN0IF9fdml0ZV9pbmplY3RlZF9vcmlnaW5hbF9maWxlbmFtZSA9IFwiL1VzZXJzL2J0YnVuemUvRG9jdW1lbnRzL1N0ZWFkZmFzdC9jYXJib24vY29uZmlnL2J1aWxkL3RhaWx3aW5kLmNvbmZpZy5tanNcIjtjb25zdCBfX3ZpdGVfaW5qZWN0ZWRfb3JpZ2luYWxfaW1wb3J0X21ldGFfdXJsID0gXCJmaWxlOi8vL1VzZXJzL2J0YnVuemUvRG9jdW1lbnRzL1N0ZWFkZmFzdC9jYXJib24vY29uZmlnL2J1aWxkL3RhaWx3aW5kLmNvbmZpZy5tanNcIjtpbXBvcnQgeyBjb2xvcnMsIGljb25zLCB0eXBvZ3JhcGh5LCBzaGFkb3dzIH0gZnJvbSAnLi9jYXJib24ubWpzJ1xuaW1wb3J0IHsgaW50ZXJhY3RWYXJpYW50UGx1Z2luIH0gZnJvbSAnLi9wbHVnaW5zL2ludGVyYWN0Lm1qcydcbmltcG9ydCB7XG5cdHR5cG9ncmFwaHlFbGVtZW50c0xpc3QsXG5cdHR5cG9ncmFwaHlQbHVnaW4sXG59IGZyb20gJy4vcGx1Z2lucy90eXBvZ3JhcGh5Lm1qcydcblxuY29uc3Qgcm9vdEZvbnRTaXplID0gMTZcblxuY29uc3QgY29udmVydFRvUmVtID0gZnVuY3Rpb24gKHBpeGVsVmFsdWUpIHtcblx0bGV0IGNhbGMgPSBwaXhlbFZhbHVlIC8gcm9vdEZvbnRTaXplXG5cdHJldHVybiBjYWxjLnRvRml4ZWQoMTApICsgJ3JlbSdcbn1cblxuY29uc3QgZ2VuZXJhdGVTdGVwcyA9IGZ1bmN0aW9uIChzdGFydCwgZW5kLCBtdWx0aXBsZSA9IDEsIGNhbGxiYWNrKSB7XG5cdGxldCBzdGVwcyA9IHt9XG5cdGNvbnN0IHZhbHVlcyA9IEFycmF5LmZyb20oXG5cdFx0bmV3IEFycmF5KGVuZCAtIHN0YXJ0ICsgMSksXG5cdFx0KHYsIGspID0+IGsgKyBzdGFydFxuXHQpLmZpbHRlcigobikgPT4gbiAlIG11bHRpcGxlID09PSAwKVxuXHR2YWx1ZXMuZm9yRWFjaCgodmFsKSA9PiB7XG5cdFx0c3RlcHNbdmFsXSA9IGNhbGxiYWNrKHZhbClcblx0fSlcblx0cmV0dXJuIHN0ZXBzXG59XG5cbmNvbnN0IGdlbmVyYXRlSWNvblNwYWNpbmdWYWx1ZXMgPSAoKSA9PlxuXHRPYmplY3QuZW50cmllcyhpY29ucykucmVkdWNlKFxuXHRcdChhY2MsIFtuYW1lLCB7IHNpemUgfV0pID0+ICh7XG5cdFx0XHQuLi5hY2MsXG5cdFx0XHRbYGljb24tJHtuYW1lfWBdOiBzaXplLFxuXHRcdH0pLFxuXHRcdHt9XG5cdClcblxuY29uc3QgZ2VuZXJhdGVJY29uU2FmZWxpc3QgPSAoKSA9PlxuXHRPYmplY3Qua2V5cyhnZW5lcmF0ZUljb25TcGFjaW5nVmFsdWVzKCkpLnJlZHVjZShcblx0XHQoYWNjLCBpY29uTmFtZSkgPT4gW2B3LSR7aWNvbk5hbWV9YCwgYGgtJHtpY29uTmFtZX1gLCAuLi5hY2NdLFxuXHRcdFtdXG5cdClcblxuZXhwb3J0IGRlZmF1bHQge1xuXHRpbXBvcnRhbnQ6ICcjYXBwY3NzJyxcblx0Y29udGVudDogWycuL3NyYy90ZW1wbGF0ZXMvKiovKi57dHdpZyxodG1sfScsICcuL3NyYy9qcy8qKi8qLntqcyx2dWV9J10sXG5cdHNhZmVsaXN0OiBbLi4udHlwb2dyYXBoeUVsZW1lbnRzTGlzdCwgLi4uZ2VuZXJhdGVJY29uU2FmZWxpc3QoKV0sXG5cdHRoZW1lOiB7XG5cdFx0ZXh0ZW5kOiB7XG5cdFx0XHRib3JkZXJXaWR0aDoge1xuXHRcdFx0XHQxOiAnMXB4Jyxcblx0XHRcdH0sXG5cdFx0fSxcblx0XHRzY3JlZW5zOiB7XG5cdFx0XHQndGlueSc6ICczNzVweCcsXG5cdFx0XHQneHMnOiAnNTYwcHgnLFxuXHRcdFx0J3NtJzogJzY0MHB4Jyxcblx0XHRcdCdtZCc6ICc3NjhweCcsXG5cdFx0XHQnbGcnOiAnMTAyNHB4Jyxcblx0XHRcdCd4bCc6ICcxMzAwcHgnLFxuXHRcdFx0JzJ4bCc6JzE2MDBweCcsXG5cdFx0fSxcblx0XHRtYXhXaWR0aDoge1xuXHRcdFx0bm9uZTogJ25vbmUnLFxuXHRcdFx0d2lkZTogJzE0NDBweCcsXG5cdFx0fSxcblx0XHRjb2xvcnM6IHtcblx0XHRcdHRyYW5zcGFyZW50OiAndHJhbnNwYXJlbnQnLFxuXHRcdFx0Y3VycmVudDogJ2N1cnJlbnRDb2xvcicsXG5cdFx0XHQuLi5jb2xvcnMsXG5cdFx0fSxcblx0XHRmb250RmFtaWx5OiBPYmplY3Qua2V5cyh0eXBvZ3JhcGh5LmZvbnRzKS5yZWR1Y2UoXG5cdFx0XHQoYWNjLCBmb250KSA9PiAoe1xuXHRcdFx0XHQuLi5hY2MsXG5cdFx0XHRcdFtmb250XTogdHlwb2dyYXBoeS5mb250c1tmb250XS5mYW1pbHksXG5cdFx0XHR9KSxcblx0XHRcdHtcblx0XHRcdFx0Ly8gQWRkIGRlZmF1bHQgZm9udCBmYW1pbGllc1xuXHRcdFx0XHRzYW5zOiBbJ0ludGVyJywgJ3N5c3RlbS11aScsICdzYW5zLXNlcmlmJ10sXG5cdFx0XHRcdHNlcmlmOiBbJ0dlb3JnaWEnLCAnc2VyaWYnXSxcblx0XHRcdFx0bW9ubzogWydNZW5sbycsICdNb25hY28nLCAnbW9ub3NwYWNlJ10sXG5cdFx0XHR9XG5cdFx0KSxcblx0XHRmb250V2VpZ2h0OiB7XG5cdFx0XHR0aGluOiAnMTAwJyxcblx0XHRcdGxpZ2h0OiAnMzAwJyxcblx0XHRcdG5vcm1hbDogJzQwMCcsXG5cdFx0XHRtZWRpdW06ICc1MDAnLFxuXHRcdFx0c2VtaWJvbGQ6ICc2MDAnLFxuXHRcdFx0Ym9sZDogJzcwMCcsXG5cdFx0XHRleHRyYWJvbGQ6ICc4MDAnLFxuXHRcdFx0YmxhY2s6ICc5MDAnLFxuXHRcdH0sXG5cdFx0Zm9udFNpemU6IGdlbmVyYXRlU3RlcHMoOCwgNzIsIDEsICh2YWwpID0+IHtcblx0XHRcdHJldHVybiBjb252ZXJ0VG9SZW0odmFsKVxuXHRcdH0pLFxuXHRcdGxpbmVIZWlnaHQ6IHtcblx0XHRcdDEwMDogJzEnLFxuXHRcdFx0MTMwOiAnMS4zJyxcblx0XHRcdDE2MDogJzEuNicsXG5cdFx0XHQvLyAxMTA6ICcxLjEnLFxuXHRcdFx0Ly8gMTIwOiAnMS4yJyxcblx0XHR9LFxuXHRcdGxldHRlclNwYWNpbmc6IHtcblx0XHRcdCctMDEnOiAnLS4wMWVtJyxcblx0XHRcdCctMDI1JzogJy0uMDI1ZW0nLFxuXHRcdFx0JzAnOiAnMCcsXG5cdFx0XHQnMDA0JzonLjAwNGVtJyxcblx0XHRcdCcwMSc6ICcuMDFlbScsXG5cdFx0XHQnMDInOiAnLjAyZW0nLFxuXHRcdFx0JzAzJzogJy4wM2VtJyxcblx0XHRcdCcwNCc6ICcuMDRlbScsXG5cdFx0XHQnMDUnOiAnLjA1ZW0nLFxuXHRcdFx0JzA2JzogJy4wNmVtJyxcblx0XHRcdCcwNyc6ICcuMDdlbScsXG5cdFx0XHQnMDgnOiAnLjA4ZW0nLFxuXHRcdFx0JzA5JzogJy4wOWVtJyxcblx0XHRcdCcxMCc6ICcuMWVtJyxcblx0XHRcdCcyMCc6ICcuMjBlbScsXG5cdFx0fSxcblx0XHRkcm9wU2hhZG93OiB7XG5cdFx0XHRub25lOiAnbm9uZScsXG5cdFx0XHQuLi5zaGFkb3dzLFxuXHRcdH0sXG5cdFx0Ym94U2hhZG93OiB7XG5cdFx0XHRub25lOiAnbm9uZScsXG5cdFx0XHQuLi5zaGFkb3dzLFxuXHRcdH0sXG5cdFx0Ym9yZGVyUmFkaXVzOiB7XG5cdFx0XHRub25lOiAnMHB4Jyxcblx0XHRcdERFRkFVTFQ6ICcyMHB4JywgLy8gVGhpcyB2YWx1ZSBzaG91bGQgYmUgcmVwbGFjZWQgd2l0aCB0aGUgbW9zdCBjb21tb24gYm9yZGVyIHJhZGl1cyB2YWx1ZVxuXHRcdFx0ZnVsbDogJzUwJScsXG5cdFx0XHRwaWxsOiAnOTk5OXB4Jyxcblx0XHR9LFxuXHRcdHNwYWNpbmc6ICgpID0+ICh7XG5cdFx0XHRpbmhlcml0OiAnaW5oZXJpdCcsXG5cdFx0XHQuLi5nZW5lcmF0ZUljb25TcGFjaW5nVmFsdWVzKCksXG5cdFx0XHQwOiAnMHB4Jyxcblx0XHRcdHMxOiAnNHB4Jyxcblx0XHRcdHMyOiAnOHB4Jyxcblx0XHRcdHMzOiAnMTJweCcsXG5cdFx0XHRzNDogJzE2cHgnLFxuXHRcdFx0czU6ICcyMHB4Jyxcblx0XHRcdHM2OiAnMjRweCcsXG5cdFx0XHRzNzogJzMycHgnLFxuXHRcdFx0czg6ICc0MHB4Jyxcblx0XHRcdHM5OiAnNDhweCcsXG5cdFx0XHRzMTA6ICc2NHB4Jyxcblx0XHRcdHMxMTogJzgwcHgnLFxuXHRcdFx0czEyOiAnOTZweCcsXG5cdFx0XHRzMTM6ICcxMjBweCcsXG5cdFx0XHRzMTQ6ICcxNjBweCcsXG5cdFx0fSksXG5cdH0sXG5cdGNvcmVQbHVnaW5zOiB7XG5cdFx0Y29udGFpbmVyOiBmYWxzZSxcblx0fSxcblx0cGx1Z2luczogW3R5cG9ncmFwaHlQbHVnaW4sIGludGVyYWN0VmFyaWFudFBsdWdpbl0sXG59XG4iLCAie1xuXHRcIm5hbWVcIjogXCJjYXJib25cIixcblx0XCJ2ZXJzaW9uXCI6IFwiMS4wLjBcIixcblx0XCJkZXNjcmlwdGlvblwiOiBcIlN0ZWFkZmFzdCdzIHN0YXJ0ZXIgcHJvamVjdCAtIENyYWZ0IENNUywgVml0ZSwgYW5kIERvY2tlclwiLFxuXHRcImF1dGhvclwiOiBcIlN0ZWFkZmFzdCBEZXNpZ24gRmlybVwiLFxuXHRcImxpY2Vuc2VcIjogXCJVTkxJQ0VOU0VEXCIsXG5cdFwicHJpdmF0ZVwiOiB0cnVlLFxuXHRcInR5cGVcIjogXCJtb2R1bGVcIixcblx0XCJzY3JpcHRzXCI6IHtcblx0XHRcImRldlwiOiBcInZpdGUgLS1jb25maWcgLi9jb25maWcvYnVpbGQvdml0ZS5jb25maWcuanNcIixcblx0XHRcImJ1aWxkXCI6IFwidml0ZSBidWlsZCAtLWNvbmZpZyAuL2NvbmZpZy9idWlsZC92aXRlLmNvbmZpZy5qc1wiLFxuXHRcdFwicHJldmlld1wiOiBcInZpdGUgcHJldmlldyAtLWNvbmZpZyAuL2NvbmZpZy9idWlsZC92aXRlLmNvbmZpZy5qc1wiLFxuXHRcdFwiYnVpbGQtaWNvbnNcIjogXCJzdmdvIC1yIC1mIC4vd2ViL2Fzc2V0cy9pY29ucy8xMiAtbyAuL3dlYi9hc3NldHMvaWNvbnMvMTIgLS1jb25maWc9Li9jb25maWcvYnVpbGQvc3Znby9pY29ucy5qc1wiXG5cdH0sXG5cdFwiZGVwZW5kZW5jaWVzXCI6IHtcblx0XHRcIkBjYXBzaXplY3NzL2NvcmVcIjogXCJeNC4xLjNcIixcblx0XHRcIkBjYXBzaXplY3NzL21ldHJpY3NcIjogXCJeMy42LjJcIixcblx0XHRcIkBjYXBzaXplY3NzL3VucGFja1wiOiBcIl40LjAuMFwiLFxuXHRcdFwiQGZhbmN5YXBwcy91aVwiOiBcIl40LjAuMzFcIixcblx0XHRcIkBoZWFkbGVzc3VpL3Z1ZVwiOiBcIl4xLjYuN1wiLFxuXHRcdFwiQHNwbGlkZWpzL3Z1ZS1zcGxpZGVcIjogXCJeMC42LjdcIixcblx0XHRcIkB2dWVwaWMvdnVlLWRhdGVwaWNrZXJcIjogXCJeMy42LjNcIixcblx0XHRcImFsZ29saWFzZWFyY2hcIjogXCJeNC4xNC4yXCIsXG5cdFx0XCJheGlvc1wiOiBcIl4xLjIuMVwiLFxuXHRcdFwiYm9keS1zY3JvbGwtbG9ja1wiOiBcIl40LjAuMC1iZXRhLjBcIixcblx0XHRcImxhenlzaXplc1wiOiBcIl41LjMuMlwiLFxuXHRcdFwicG9zdGNzc1wiOiBcIl44LjQuMzFcIixcblx0XHRcInRhaWx3aW5kY3NzXCI6IFwiXjMuMy4zXCIsXG5cdFx0XCJ0ZXJzZXJcIjogXCJeNS40LjBcIixcblx0XHRcInV1aWRcIjogXCJeOC4zLjJcIixcblx0XHRcInYtc2Nyb2xsLWxvY2tcIjogXCJeMS4zLjFcIixcblx0XHRcInZ1ZVwiOiBcIl4zLjIuMjVcIixcblx0XHRcInZ1ZS1heGlvc1wiOiBcIl4zLjUuMlwiLFxuXHRcdFwidnVlLXJvdXRlclwiOiBcIl40LjEuNVwiXG5cdH0sXG5cdFwiZGV2RGVwZW5kZW5jaWVzXCI6IHtcblx0XHRcIkBraXRxbC92aXRlLXBsdWdpbi13YXRjaC1hbmQtcnVuXCI6IFwiXjAuMy43XCIsXG5cdFx0XCJAb3JpZ2luanMvdml0ZS1wbHVnaW4tY29tbW9uanNcIjogXCJeMS4wLjNcIixcblx0XHRcIkB2aXRlanMvcGx1Z2luLWxlZ2FjeVwiOiBcIl40LjEuMVwiLFxuXHRcdFwiQHZpdGVqcy9wbHVnaW4tdnVlXCI6IFwiXjQuNC4wXCIsXG5cdFx0XCJhdXRvcHJlZml4ZXJcIjogXCJeMTAuNC43XCIsXG5cdFx0XCJucG0td2F0Y2hcIjogXCJeMC4xMS4wXCIsXG5cdFx0XCJvbmNoYW5nZVwiOiBcIl43LjEuMFwiLFxuXHRcdFwicG9zdGNzcy1pbXBvcnRcIjogXCJeMTUuMS4wXCIsXG5cdFx0XCJwcmV0dGllclwiOiBcIjIuNy4xXCIsXG5cdFx0XCJyaW1yYWZcIjogXCJeMy4wLjJcIixcblx0XHRcInJvbGx1cC1wbHVnaW4tY3JpdGljYWxcIjogXCJeMS4wLjhcIixcblx0XHRcInN2Z29cIjogXCJeMi44LjBcIixcblx0XHRcInZpdGVcIjogXCJeNC40LjExXCIsXG5cdFx0XCJ2aXRlLXBsdWdpbi1iYW5uZXJcIjogXCJeMC4zLjBcIixcblx0XHRcInZpdGUtcGx1Z2luLWNvbXByZXNzaW9uXCI6IFwiXjAuNS4xXCIsXG5cdFx0XCJ2aXRlLXBsdWdpbi1tYW5pZmVzdC1zcmlcIjogXCJeMC4xLjBcIixcblx0XHRcInZpdGUtcGx1Z2luLXJlc3RhcnRcIjogXCJeMC4zLjFcIlxuXHR9LFxuXHRcImJyb3dzZXJzbGlzdFwiOiBbXG5cdFx0XCJkZWZhdWx0c1wiXG5cdF1cbn1cbiJdLAogICJtYXBwaW5ncyI6ICI7QUFBb1YsU0FBUyxvQkFBb0I7QUFDalgsT0FBTyxZQUFZO0FBQ25CLE9BQU8saUJBQWlCO0FBQ3hCLE9BQU8sWUFBWTtBQUNuQixPQUFPLGlCQUFpQjtBQUN4QixPQUFPLGFBQWE7QUFDcEIsT0FBTyxTQUFTO0FBQ2hCLFNBQVMsb0JBQW9COzs7QUNQNlQsT0FBTyxtQkFBbUI7QUFDcFgsT0FBTyx3QkFBd0I7QUFDL0IsT0FBTyxpQkFBaUI7OztBQ0YrUixTQUFTLGtCQUFrQjs7O0FDRTNVLElBQU0sU0FBUztBQUFBLEVBQ3JCLE9BQU87QUFBQSxFQUNQLE9BQU87QUFBQTtBQUFBLEVBR1AsTUFBTTtBQUFBLElBQ0wsSUFBSTtBQUFBLElBQ0osS0FBSztBQUFBLElBQ0wsS0FBSztBQUFBLElBQ0wsS0FBSztBQUFBLElBQ0wsS0FBSztBQUFBLElBQ0wsS0FBSztBQUFBLElBQ0wsS0FBSztBQUFBLElBQ0wsS0FBSztBQUFBLElBQ0wsS0FBSztBQUFBLElBQ0wsS0FBSztBQUFBLEVBQ047QUFBQSxFQUNBLE1BQU07QUFBQSxJQUNMLElBQUk7QUFBQSxJQUNKLEtBQUs7QUFBQSxJQUNMLEtBQUs7QUFBQSxJQUNMLEtBQUs7QUFBQSxJQUNMLEtBQUs7QUFBQSxJQUNMLEtBQUs7QUFBQSxJQUNMLEtBQUs7QUFBQSxJQUNMLEtBQUs7QUFBQSxJQUNMLEtBQUs7QUFBQSxJQUNMLEtBQUs7QUFBQSxFQUNOO0FBQ0Q7QUFFTyxJQUFNLFFBQVE7QUFBQTtBQUFBLEVBRXBCLElBQUksRUFBRSxNQUFNLE1BQU0sTUFBTSxRQUFRLFFBQVEsS0FBSztBQUM5QztBQUVPLElBQU0s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
