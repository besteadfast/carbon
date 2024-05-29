<template>
  <TabGroup>
    <TabList :class="listClasses">
      <slot name="tab-title"></slot>
    </TabList>
    <TabPanels>
      <slot name="tab-content"></slot>
    </TabPanels>
  </TabGroup>
</template>

<script setup>
import { TabGroup, TabList, TabPanels } from '@headlessui/vue'

const props = defineProps({
  listClasses: String
})
</script>
