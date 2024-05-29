<template>
    <button v-if="button">
        <slot></slot>
    </button>
    <a v-else-if="anchor">
        <slot></slot>
    </a>
</template>
<script setup>
const props = defineProps({
  button: Boolean,
  anchor: Boolean,
  type: String,
  buttonClasses: String,
  interactClasses: String
})
</script>
