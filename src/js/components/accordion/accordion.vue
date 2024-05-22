<template>
    <div>
        <button
            class="flex justify-between items-center transition-all duration-300 ease-in-out w-full text-left font-bold ring-0 outline-none interact:outline-none cursor-pointer"
            :class="props.customStyles ? props.customStyles : defaultStyles"
            :aria-expanded="show"
            :aria-controls="props.index"
            :id="'accordion_' + props.index"
            tabindex="1"
            @click="show = !show"
            @blur="show = false">
            {{ props.title }}
            <div
                class="transition-opacity duration-300 ease-in-out text-[20px]"
                :class="[show ? 'opacity-0 hidden' : 'opacity-1']"><slot name="closed-icon" /></div>
            <div
                class="transition-opacity duration-300 ease-in-out text-[20px]"
                :class="[show ? 'opacity-1' : 'opacity-0 hidden']"><slot name="opened-icon" /></div>
        </button>
        <div
            :id="props.index"
            class="grid overflow-hidden transition-all duration-300 ease-in-out"
            :class="[show ? 'grid-rows-[1fr] opacity-1' : 'grid-rows-[0fr] opacity-0'],[props.customChildStyles ? props.customChildStyles : defaultChildStyles]"
            :hidden="!show">
            <div class="overflow-hidden">
               <div class="px-s4 py-s4" v-html=props.body />
            </div>
        </div>
    </div>
</template>
<script setup>
import { defineProps, ref } from 'vue'

const show = ref(false)

const props = defineProps({
    index: Number,
    title: String,
    body: String,
    customStyles: String,
    customChildStyles: String
})

const defaultStyles = "p-s4 interact:bg-gray-200 border-b border-gray-200"
const defaultChildStyles = "''"

</script>
