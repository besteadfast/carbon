<template>
	<details
		class="accordion-item border-x border-b border-gray-200 first:rounded-t last:rounded-b first:border-t"
		as="div"
		:open="open || isClosing"
	>
		<summary
			class="flex justify-between items-center w-full px-s4 py-s2 bg-transparent interact:bg-blue-100 interact:outline-none transition duration-300 hover:cursor-pointer"
			ref="accButtonRef"
		>
			<slot name="button">
				Accordion Title
				<div
					class="transition duration-300"
					:class="open ? 'rotate-0' : 'rotate-180'"
				>
					^
				</div>
			</slot>
		</summary>
		<div
			class="max-h-0 transition-all overflow-hidden"
			ref="accPanelRef"
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
		}
	})
})

watch(open, (open, oldOpen) => {
	const content = accPanelRef.value
	if (open) {
		content.style.maxHeight = content.scrollHeight + 'px'
		isOpening.value = true
		if (scrollOnOpen) {
			document.documentElement.scrollTo({
				top:
					accButtonRef.value.getBoundingClientRect().top + window.scrollY - 20,
			})
		}
	} else {
		content.style.maxHeight = 0
		isClosing.value = true
	}
})
</script>
