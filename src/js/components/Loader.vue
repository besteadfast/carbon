<template>
	<div ref="root">
		<Transition 
			:class="`motion-reduce:animate-none motion-reduce:transition-none transition duration-500 delay-${delay}`"
			v-bind="transitionProperties"
		>
			<div v-show="loaded">
				<slot></slot>
			</div>
		</Transition>
	</div>
</template>
<script setup>
import { ref, onMounted, computed } from 'vue'

const root = ref(null)
const loaded = ref(false)

const props = defineProps({
	type: {
		type: String,
		default: 'left'
	},
	delay: {
		type: String,
		default: '0'
	}
})

const transitionProperties = computed(() => {
	switch (props.type) {
		case 'scale':
			return {
				'enter-from-class': 'scale-75',
				'enter-to-class': 'scale-100'
			}
		case 'fade':
			return {
				'enter-from-class': 'opacity-0',
				'enter-to-class': 'opacity-1'
			}
		case 'right':
			return {
				'enter-active-class': 'animate-from-right'
			}
		case 'left':
			return {
				'enter-active-class': 'animate-from-left'
			}
		case 'top':
			return {
				'enter-from-class': 'opacity-0 -translate-y-s4',
				'enter-to-class': 'opacity-1 translate-y-0'
			}
		case 'right-simple':
			return {
				'enter-from-class': 'opacity-0 translate-s4',
				'enter-to-class': 'opacity-1 translate-0'
			}
	}
})

onMounted(() => {

	const prefersReduced = window.matchMedia(`(prefers-reduced-motion: reduce)`)

	const target = root.value

	const config = {
		threshold: 0.5,
		rootMargin: '0px'
	}
		
	if ( prefersReduced.matches === true ) {
		console.log(prefersReduced)
		loaded.value = true
	} else {
		const handleIntersection = ((entries, observer) => {
			entries.map((entry) => {
				if( !loaded.value ) {
					observer.observe(entry.target)
					loaded.value = entry.isIntersecting
				} else {
					observer.unobserve(target)
				}
			})
		})

		const observer = new IntersectionObserver(handleIntersection, config)

		if (target) observer.observe(target)
	}
	
})
</script>