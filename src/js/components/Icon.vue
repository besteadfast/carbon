<template>
	<svg :class="classes">
		<use :xlink:href="path"></use>
	</svg>
</template>

<script>
import stallion from '@build/stallion.cjs'
const { icons } = stallion

function sizeExists(size) {
	return Object.keys(icons).includes(size)
}

export default {
	props: {
		name: String,
		size: {
			tiny: String,
			validator: sizeExists,
		},
	},
	computed: {
		_size() {
			return icons[this.size]
		},
		path() {
			const { abbr, folder } = this._size
			const path = abbr
				? `/assets/icons/${folder}/${this.name}.svg#icon-definition`
				: `/assets/icons/${folder}/${this.name}.svg#icon-definition`
			const url = encodeURI(path)
			return url
		},
		classes() {
			return [`w-icon-${this.size}`, `h-icon-${this.size}`]
		},
	},
}
</script>
