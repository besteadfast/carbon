<template>
  <svg class="icon-svg" :class="[this._size.heightClass, this._size.widthClass]">
    <use :xlink:href="path"></use>
  </svg>
</template>

<script>
const sizes = {
  tiny: { abbr: 't', heightClass: 'h-icon-tiny', widthClass: 'w-icon-tiny' },
  xs: { abbr: 'xs', heightClass: 'h-icon-xs', widthClass: 'w-icon-xs' }
}
function sizeExists(size) {
  return Object.keys(sizes).includes(size)
}

export default {
  props: {
    name: String,
    size: {
      tiny: String,
      validator: sizeExists
    },
  },
  computed: {
    _size() {
      return sizes[this.size]
    },
    path() {
      const sizeAbbreviation = this._size.abbr
      return `/assets/icons/${sizeAbbreviation}-${this.name}.svg#icon-definition`
    }
  }
}
</script>
