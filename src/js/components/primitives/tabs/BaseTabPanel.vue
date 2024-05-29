<template>
    <TabPanel :class="panelClasses">
        <slot></slot>
    </TabPanel>
</template>
<script setup>
import { TabPanel } from '@headlessui/vue'

const props = defineProps({
  panelClasses: String
})
</script>
