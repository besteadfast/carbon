import 'vite/modulepreload-polyfill'
import { createApp } from 'vue'

/* Import CSS, which gets bundled _separately_ from JS  */
import '@src/css/main.pcss'

/* Import components */
import Icon from './components/Icon.vue'

/* Create Vue */
const app = createApp({
	delimiters: ['${', '}'],
})

/*
*	Register components: every component registered here will be accessible globally
* both in Vue and Twig templates.
*/
app.component('Icon', Icon)

/* Mount Vue to #app element */
app.mount('#app')

// Accept HMR as per: https://vitejs.dev/guide/api-hmr.html
if (import.meta.hot) {
    import.meta.hot.accept(() => {
        console.log('HMR')
    })
}
