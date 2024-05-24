<template>
  <BaseDropdown
    buttonClasses="flex justify-between items-center w-full border rounded py-s2 px-s4 mb-s2 bg-transparent interact:bg-blue-100 transition duration-300"
    iconClasses="transform rotate-0 transition-all duration-300"
    iconOpenClasses="transform rotate-180 transition-all duration-300"
    optionsContainerClasses="border rounded"
    optionClasses="cursor-pointer w-full py-s2 px-s4 interact:bg-blue-100 interact:outline-none transition duration-300"
    optionActiveClasses="bg-blue-100"
    optionSelectedClasses="bg-blue-100"
    :options="options"
    :transitionClasses="{
        enter: 'transition-scale duration-150 origin-top ease-in-out',
        enterFrom: 'scale-y-0 opacity-0',
        enterTo: 'scale-y-100 opacity-100',
        leave: 'transition-scale duration-300 origin-top ease-in-out',
        leaveFrom: 'scale-y-100 opacity-100',
        leaveTo: 'scale-y-0 opacity-0'
    }"
  >
  <template #icon>
    <slot name="icon"></slot>
  </template>
  </BaseDropdown>
</template>

<script setup>
import BaseDropdown from '../primitives/dropdown/BaseDropdown.vue'

const props = defineProps({
  options: Object
})
</script>
