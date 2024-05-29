<template>
    <component
        :is="href ? 'a' : 'button'"
        :href="href"
        :class="[
            sizingClasses,
            transitionClasses,
            type === 'outline' ? outlineClasses : '',
            type === 'solid' ? solidClasses : '',
            type === 'text' ? textClasses : ''
        ]"
    >
        <slot></slot>
    </component>
</template>
<script setup>
defineProps({
  button: Boolean,
  anchor: Boolean,
  type: String,
  outlineClasses: {
    type: String,
    default: 'rounded border border-gray-300 bg-white interact:bg-gray-600 interact:text-white'
  },
  solidClasses: {
    type: String,
    default: 'rounded bg-gray-600 text-white interact:bg-gray-700'
  },
  textClasses: {
    type: String,
    default: 'text-gray-600 interact:text-gray-800'
  },
  sizingClasses: {
    type: String,
    default: 'px-s4 py-s2'
  },
  transitionClasses: {
    type: String,
    default: 'transition-all duration-300'
  },
  buttonClasses: String,
  interactClasses: String,
  href: String
})
</script>
