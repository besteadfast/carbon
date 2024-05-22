<template>
    <div
        class="max-w-[600px] mx-auto rounded"
        @blur="open = false"
    >
        <button
            class="flex justify-between items-center px-s8 py-s4 overflow-hidden rounded w-full cursor-pointer ring-0 outline-none transition-all duration-300 ease-in-out"
            :class="[open ? props.customOpenStyles : props.customClosedStyles],[props.customStyles ? props.customStyles : defaultStyles]"
            tabindex="1"
            :aria-expanded="open"
            aria-controls="dropdownOptions"
            @click="open = !open"
        >
            {{ selected }}
            <span class="font-bold text-[20px] transition-all duration-300 ease-in-out" :class="[open ? 'rotate-0' : 'rotate-180']"><slot name="icon" /></span>
        </button>
        <div
            class="grid overflow-hidden transition-all duration-300 ease-in-out border border-t-0 rounded-b"
            :class="[
                open ? 'grid-rows-[1fr] opacity-1' : 'grid-rows-[0fr] opacity-0'
            ],[
                props.customMenuStyles ? props.customMenuStyles : 'border-gray-200'
            ]"
            @mouseleave="open = false"
            id="dropdownOptions"
            :hidden="!open"
        >
            <ul class="overflow-hidden">
                <li
                    class="px-s8 py-s4 cursor-pointer ring-0 outline-0 transition-all duration-300 ease-in-out"
                    :class="props.customChildStyles ? props.customChildStyles : defaultChildStyles"
                    v-for="(option, i) of options"
                    :key="i"
                    :tabindex="open ? 1 : -1"
                    @click="
                        selected = option;
                        open = false;
                        $emit('input', option);
                    "
                    @keydown.enter="
                        selected = option;
                        open = false;
                        $emit('input', option);
                    "
                    @blur="(i == options.length - 1 ? open = false : null)"
                >
                    {{ option }}
                </li>
            </ul>
        </div>
    </div>
</template>
<script setup>
import { defineProps, onMounted, ref } from 'vue'

const props = defineProps({
  options: {
    Array,
    required: true
  },
  default: String,
  customClosedStyles: String,
  customOpenStyles: String,
  customChildStyles: String,
  customMenuStyles: String,
})


const defaultStyles = "border border-gray-200 interact:rounded-b-none"
const defaultChildStyles = "interact:bg-gray-200"

const open = ref(false)

const selected = ref(props.default ? props.options[0] : props.options.length > 0 ? props.options[0] : null)
</script>
