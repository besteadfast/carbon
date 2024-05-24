<template>
    <BaseAccordion
        containerClasses="border-x border-b border-gray-200 first:rounded-t last:rounded-b first:border-t "
        buttonClasses="flex justify-between items-center w-full px-s4 py-s2 bg-transparent interact:bg-blue-100 interact:outline-none transition duration-300"
        panelClasses="p-s4"
        iconClasses="rotate-0 transition duration-300"
        iconTransitionClasses="rotate-180 transition duration-300"
        :transitionClasses="{
            enter: 'transition-opacity duration-300',
            enterFrom: 'opacity-0',
            enterTo: 'opacity-100',
            leave: 'transition-opacity duration-300',
            leaveFrom: 'opacity-100',
            leaveTo: 'opacity-0'
        }"
    >
        <template #button>
            <span>
                <slot name="title"></slot>
            </span>
        </template>
        <template #button-icon>
            <span>
                <slot name="icon"></slot>
            </span>
        </template>
        <template #content>
            <slot name="content"></slot>
        </template>
    </BaseAccordion>
</template>
<script setup>
import { DisclosureButton, DisclosurePanel } from '@headlessui/vue'
import BaseAccordion from '../primitives/accordion/BaseAccordion.vue'
</script>
