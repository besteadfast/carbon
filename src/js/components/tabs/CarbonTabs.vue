<template>
    <BaseTabs listClasses="mb-s2 bg-gray-100 rounded p-s2">
        <template #tab-title>
            <slot name="title"></slot>
        </template>
        <template #tab-content>
            <slot name="content"></slot>
        </template>
    </BaseTabs>
</template>
<script setup>
import BaseTabs from '../primitives/tabs/BaseTabs.vue'
</script>
