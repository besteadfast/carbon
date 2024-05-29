<template>
    <Tab as="template" v-slot="{ selected }">
        <button
            :class="`${tabClasses} ${selected ? selectedTabClasses : unselectedTabClasses}`"
        >
            <slot></slot>
        </button>
    </Tab>
</template>
<script setup>
import { Tab } from '@headlessui/vue'

const props = defineProps({
  tabClasses: String,
  selectedTabClasses: String,
  unselectedTabClasses: String,
})
</script>
