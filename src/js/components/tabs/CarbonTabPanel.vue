<template>
    <BaseTabPanel
        panelClasses="bg-white border border-blue-300 shadow-md rounded p-s4"
    >
        <slot></slot>
    </BaseTabPanel>
</template>
<script setup>
import BaseTabPanel from '../primitives/tabs/BaseTabPanel.vue'
</script>
