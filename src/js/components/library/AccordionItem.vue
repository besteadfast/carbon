<template>
	<details
		class="accordion-item border-x border-b border-gray-200 first:rounded-t last:rounded-b first:border-t"
		as="div"
		:open="open || isClosing || isOpening"
	>
		<summary
			class="flex justify-between items-center w-full px-s4 py-s2 bg-transparent interact:bg-blue-100 interact:outline-none transition duration-300 hover:cursor-pointer"
			ref="accButtonRef"
		>
			<slot name="button">
				Accordion Title
				<div
					class="transition duration-300"
					:class="open ? 'rotate-180' : 'rotate-0'"
				>
					<svg fill="#000000" height="12px" width="12px" version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
						viewBox="0 0 330 330" xml:space="preserve">
					<path id="XMLID_225_" d="M325.607,79.393c-5.857-5.857-15.355-5.858-21.213,0.001l-139.39,139.393L25.607,79.393
						c-5.857-5.857-15.355-5.858-21.213,0.001c-5.858,5.858-5.858,15.355,0,21.213l150.004,150c2.813,2.813,6.628,4.393,10.606,4.393
						s7.794-1.581,10.606-4.394l149.996-150C331.465,94.749,331.465,85.251,325.607,79.393z"/>
					</svg>
				</div>
			</slot>
		</summary>
		<div
			class="transition-all overflow-hidden"
			ref="accPanelRef"
			style="max-height:0;"
		>
			<slot name="content">
				<div class="p-s4 h-[100px] flex items-center">Accordion Body</div>
			</slot>
		</div>
	</details>
</template>
<script setup>
import { ref, inject, onMounted, computed, watch } from 'vue'

const accButtonRef = ref(null)
const accPanelRef = ref(null)

const registerItem = inject('registerItem')
const toggleItem = inject('toggleItem')
const openItems = inject('openItems')
const scrollOnOpen = inject('scrollOnOpen')

const id = ref(null)
const isClosing = ref(false)
const isOpening = ref(false)
const open = computed(() => openItems.value.includes(id.value))

onMounted(() => {
	id.value = registerItem()
	accButtonRef.value.addEventListener('click', (event) => {
		event.preventDefault()
		toggleItem(id)
	})
	accPanelRef.value.addEventListener('transitionend', (e) => {
		if (isClosing.value) {
			isClosing.value = false
		} else if (isOpening.value) {
			isOpening.value = false
			accPanelRef.value.style = ""
		}
	})
})

watch(open, (open, oldOpen) => {
	const content = accPanelRef.value
	if (open) {
		content.style.maxHeight = content.scrollHeight + 'px'
		isOpening.value = true
		setTimeout(() => {
			content.style.maxHeight = content.scrollHeight + 'px'
			if (scrollOnOpen) {
				document.documentElement.scrollTo({
					top:
						accButtonRef.value.getBoundingClientRect().top + window.scrollY - 20,
				})
			}
		}, 0);
	} else {
		isClosing.value = true
		content.style.maxHeight = content.scrollHeight + 'px'
		setTimeout(() => {
			content.style.maxHeight = 0
		}, 0)
	}
})
</script>
