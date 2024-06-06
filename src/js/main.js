import 'vite/modulepreload-polyfill'
import { createApp, defineAsyncComponent, reactive, toRefs } from 'vue'
import { TransitionRoot, DialogDescription, DialogTitle } from '@headlessui/vue'

/* Import CSS, which gets bundled _separately_ from JS  */
import '@src/css/main.pcss'

/* Import components */
const eagerComponents = import.meta.glob(
	['./components/**/*.vue', '!./components/**/*.lazy.vue'],
	{ eager: true }
)
const lazyComponents = import.meta.glob('./components/**/*.lazy.vue')

const headlessUiComponents = { TransitionRoot, DialogDescription, DialogTitle }

const store = reactive({
	modal: {
		closeModal: () => {
			store.modal.activeModalId = null
		},
		openModal: (id) => {
			store.modal.activeModalId = id
		},
		activeModalId: null,
	},
})

/* Create Vue */
const app = createApp({
	delimiters: ['${', '}'],
})

/*
 *	Automatically register components: components will be accessible globally
 * both in Vue and Twig templates.
 */

//register eager components
Object.entries(eagerComponents).forEach(([path, definition]) => {
	const componentName = path.split('/').pop().replace('.vue', '')
	app.component(componentName, definition.default)
})

//register lazy components
Object.entries(lazyComponents).forEach(([path, module]) => {
	const componentName = path.split('/').pop().replace('.lazy.vue', '')
	const componentDefinition = defineAsyncComponent(module)
	app.component(componentName, componentDefinition)
})

//register imported components
Object.entries(headlessUiComponents).forEach(([key, definition]) => {
	app.component(key, definition)
})

app.config.globalProperties.$store = store

/* Mount Vue to #app element */
app.mount('#app')

// Accept HMR as per: https://vitejs.dev/guide/api-hmr.html
if (import.meta.hot) {
	import.meta.hot.accept(() => {
		console.log('HMR')
	})
}
