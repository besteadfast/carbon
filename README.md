# Stallion

Steadfast's starter project - Craft CMS, Webpack, and Docker

## Icons

### Adding new icons
Icons are set up to automatically pull from the `/web/assets/icons` directory, but new icons need to be processed before usage. To add a new icon:
- Move the `svg` file to `/web/assets/icons`
- Run `docker-compose exec webpack npm run svg`

And boom, your icons should be ready to go!

### `<Icon>`

**Props**
- **Name** (e.g. "plus"): the name of the icon, **excluding** the sizing prefix (e.g. `xs-`), which is automatically added by the component.
- **Size** (e.g. "tiny"): the size the icon was designed at.

**Usage**

```html
<icon name="plus" size="xs"></icon>
<icon name="bullet" size="tiny"></icon>
```


### Adding new icon sizes

To add a new icon size:
1. Define the icon size in the `<Icon>` component @ /src/components/Icon.vue
1. Define the icon size in the Tailwind config under `iconSizes`
