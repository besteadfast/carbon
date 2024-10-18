<template>
	<div ref="accordionRef">
		<slot></slot>
	</div>
</template>

<script setup>
import { onMounted, ref, provide } from 'vue'

const props = defineProps({
	exclusiveOpen: {
		type: Boolean,
		default: false,
	},
	scrollOnOpen: {
		type: Boolean,
		default: false,
	},
	defaultOpen: {
		type: Array,
		default: [],
	},
})

const accordionRef = ref(null)

const size = ref(0)
const openItems = ref([])
const query = ref(null)

onMounted(() => {
	if (props.exclusiveOpen && props.defaultOpen.length > 1) {
		console.warn('Exclusive open accordion opening more than 1 item by default')
	}

	const url = new URL(window.location.href)
	query.value = `accordion${
		accordionRef.value.id ? '-' + accordionRef.value.id : ''
	}`
	const queryOpenItems = url.searchParams.get(query.value)
	if (queryOpenItems) {
		openItems.value = queryOpenItems.split(',').map((elt) => Number(elt))
	} else if (props.defaultOpen.length) {
		openItems.value = props.defaultOpen
	}
})

const registerItem = () => {
	const index = size.value
	size.value = size.value + 1
	return index
}

const toggleItem = (id) => {
	if (openItems.value.includes(id.value)) {
		openItems.value.splice(openItems.value.indexOf(id.value), 1)
	} else {
		if (props.exclusiveOpen) {
			openItems.value = []
		}
		openItems.value.push(id.value)
	}

	const url = new URL(window.location.href)
	if (openItems.value.length) {
		url.searchParams.set(query.value, openItems.value.toString())
	} else {
		url.searchParams.delete(query.value)
	}
	window.history.replaceState(null, '', url)
}

provide('registerItem', registerItem)
provide('toggleItem', toggleItem)
provide('openItems', openItems)
provide('scrollOnOpen', props.scrollOnOpen)
</script>
