<template>
    <BaseTab
        tabClasses="px-s4 py-s2 border-blue-300 border mx-s1 rounded interact:bg-white transition duration-300"
        unselectedTabClasses="bg-gray-100"
        selectedTabClasses="bg-white"
    >
        <slot></slot>
    </BaseTab>
</template>
<script setup>
import BaseTab from '../primitives/tabs/BaseTab.vue'
</script>
