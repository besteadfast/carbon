<template>
    <Disclosure
        :class="containerClasses"
        as="div"
        v-slot="{ open }"
    >
            <DisclosureButton :class="buttonClasses">
                <slot name="button"></slot>
                <div :class="open ? iconTransitionClasses : iconClasses">
                    <slot name="button-icon"></slot>
                </div>
            </DisclosureButton>
            <TransitionRoot v-bind="transitionClasses">
                <DisclosurePanel :class="panelClasses">
                    <slot name="content"></slot>
                </DisclosurePanel>
            </TransitionRoot>
    </Disclosure>
</template>
<script setup>
import {
  Disclosure,
  DisclosureButton,
  DisclosurePanel,
  TransitionRoot
} from '@headlessui/vue'

const props = defineProps({
  buttonClasses: String,
  iconClasses: String,
  iconTransitionClasses: String,
  containerClasses: String,
  panelClasses: String,
  transitionClasses: Object
})

</script>
