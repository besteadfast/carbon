<template>
  <Listbox v-model="selectedOption">
    <ListboxButton
        :class="buttonClasses"
        v-slot="{ open }"
    >
        <span>{{ selectedOption.title }}</span>
        <span
            :class="open ? iconOpenClasses : iconClasses"
        >
        <slot name="icon"></slot>
        </span>
    </ListboxButton>
    <TransitionRoot
        v-bind="transitionClasses"
    >
        <ListboxOptions :class="optionsContainerClasses">
            <ListboxOption
                as="template"
                v-for="option in options"
                :key="option.id"
                :value="option"
                :disabled="option.unavailable"
                v-slot="{ active, selected }"
            >
                <li
                    :class="`
                        ${optionClasses} ${active ? optionActiveClasses : ''} ${selected ? optionSelectedClasses : ''} ${option.unavailable ? optionUnavailableClasses : ''}
                    `"
                >
                    {{ option.title }}
                </li>
            </ListboxOption>
        </ListboxOptions>
    </TransitionRoot>
  </Listbox>
</template>

<script setup>
  import { ref } from 'vue'
  import {
    Listbox,
    ListboxButton,
    ListboxOptions,
    ListboxOption,
    TransitionRoot
  } from '@headlessui/vue'

  const props = defineProps({
    buttonClasses: String,
    iconClasses: String,
    iconOpenClasses: String,
    optionClasses: String,
    optionsContainerClasses: String,
    optionActiveClasses: String,
    optionSelectedClasses: String,
    optionUnavailableClasses: String,
    options: Object,
    transitionClasses: Object
  })

  const selectedOption = ref(props.options[0])
</script>
