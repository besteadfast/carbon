<template>
    <button
        v-if="button"
        :href="href"
        class="transition-all duration-300"
        :class="
            [type === 'outline' ? outlineClasses : ''],
            [type === 'solid' ? solidClasses : ''],
            [type === 'text' ? textClasses : '']
        "
    >
        <slot></slot>
    </button>
    <a
        v-else-if="anchor"
        :href="href"
        class="transition-all duration-300"
        :class="
            [type === 'outline' ? outlineClasses : ''],
            [type === 'solid' ? solidClasses : ''],
            [type === 'text' ? textClasses : '']
        "
    >
        <slot></slot>
    </a>
</template>
<script setup>
defineProps({
  button: Boolean,
  anchor: Boolean,
  type: String,
  outlineClasses: {
    type: String,
    default: 'px-s4 py-s2 rounded border border-gray-300 bg-white interact:bg-gray-600 interact:text-white transition duration-300'
  },
  solidClasses: {
    type: String,
    default: 'px-s4 py-s2 rounded bg-gray-600 text-white interact:bg-gray-700 transition duration-300'
  },
  textClasses: {
    type: String,
    default: 'text-gray-600 interact:text-gray-800'
  },
  buttonClasses: String,
  interactClasses: String,
  href: String
})
</script>
