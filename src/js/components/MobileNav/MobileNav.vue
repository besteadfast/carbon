<script>
import { enableBodyScroll, disableBodyScroll } from 'body-scroll-lock'

const $root = document.documentElement

export default {
	data() {
		return {
			isOpen: false,
			scrollContainer: null
		}
	},
	methods: {
		toggle() {
			this.isOpen = !this.isOpen
			if (this.isOpen) {
				this.scrollContainer.classList.add('no-scroll')
			} else {
				this.scrollContainer.classList.remove('no-scroll')
			}
		},
		goToItem() {
			this.isOpen = !this.isOpen
			this.scrollContainer.classList.remove('no-scroll')
		}
	},
	mounted() {
		this.scrollContainer = document.querySelector('body')
	}
}
</script>

<template>
	<nav @menu-button-clicked="toggle()" ref="navBar"
		class="nav__mobile lg:hidden absolute w-full top-s12 left-0 bg-white transition-all ease-in-out duration-500 overflow-hidden"
		:class="{
			'h-screen': isOpen,
			'max-h-0 h-0': !isOpen
		}">
		<ul class="flex flex-col px-s8 text-blue-600 text-center text-sm text-p-l1 p-lg font-bold justify-start items-center gap-s6 py-s12 transition-all ease delay-200 duration-300 overflow-y-scroll"
			:class="{
					'opacity-100 h-full overflow-scroll': isOpen,
					'opacity-0 h-0 overflow-hidden': !isOpen
				}">
						<slot name="item"></slot>
		</ul>
	</nav>
	<div class="h-full flex items-center relative lg:hidden" ref="menubtnwrapper">
		<button class="menu-btn h-s8 w-s8 outline-none" @click="toggle()" :value="isOpen"
			aria-label="toggle main navigation z-10" :aria-expanded="isOpen" :aria-controls="`collapse${_uid}`">
			<span class="absolute w-s8 block bg-white h-[2px] origin-left-center transition-all ease-in-out delay-150"
				:class="{
						'rotate-45 top-[20px]': isOpen,
						'rotate-0 top-[4px]': !isOpen
					}"></span>
			<span
				class="absolute block opacity-100 bg-white h-[2px] top-1/2 origin-left-center transition-all ease-in-out delay-150"
				:class="{
						'w-0 opacity-0': isOpen,
						'block w-s8': !isOpen
					}"></span>
			<span class="absolute w-s8 block bg-white h-[2px] origin-left-center transition-all ease-in-out delay-150"
				:class="{
						'-rotate-45 bottom-[20px]': isOpen,
						'-rotate-0 bottom-[4px]': !isOpen
					}"></span>
		</button>

	</div>
</template>