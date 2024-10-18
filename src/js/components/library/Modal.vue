<template>
	<TransitionRoot
		:show="$modals.activeModalId === modalId"
		as="template"
		enter="duration-200 ease-out"
		enterFrom="opacity-0"
		enterTo="opacity-100"
		leave="duration-200 ease-in"
		leaveFrom="opacity-100"
		leaveTo="opacity-0"
	>
		<Dialog
			@close="$modals.closeModal"
			class="relative z-50"
			:unmount="false"
		>
			<div
				class="fixed inset-0 flex w-screen items-center justify-center bg-black/30"
				aria-hidden="true"
			/>
			<div class="fixed inset-0 overflow-y-scroll w-screen">
				<div class="min-h-full flex items-center justify-center">
					<DialogPanel
						class="w-[600px] h-auto relative bg-white"
						:class="{ 'overflow-y-auto': hasOverscroll }"
					>
						<slot>
							<div class="modal-body">
								<div class="px-s8 py-s10 border-t-2 border-gray-200 group">
									<ModalTitle>Title</ModalTitle>
									<ModalDescription> Description </ModalDescription>
									<p>Other Body content</p>
								</div>
							</div>
						</slot>
						<button
							class="absolute top-s8 right-s8 px-s2"
							@click="$modals.closeModal"
							type="button"
							aria-label="Close modal"
						>
						<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" fill="#000000" height="12px" width="12px" version="1.1" viewBox="0 0 460.775 460.775" >
						<path d="M285.08,230.397L456.218,59.27c6.076-6.077,6.076-15.911,0-21.986L423.511,4.565c-2.913-2.911-6.866-4.55-10.992-4.55  c-4.127,0-8.08,1.639-10.993,4.55l-171.138,171.14L59.25,4.565c-2.913-2.911-6.866-4.55-10.993-4.55  c-4.126,0-8.08,1.639-10.992,4.55L4.558,37.284c-6.077,6.075-6.077,15.909,0,21.986l171.138,171.128L4.575,401.505  c-6.074,6.077-6.074,15.911,0,21.986l32.709,32.719c2.911,2.911,6.865,4.55,10.992,4.55c4.127,0,8.08-1.639,10.994-4.55  l171.117-171.12l171.118,171.12c2.913,2.911,6.866,4.55,10.993,4.55c4.128,0,8.081-1.639,10.992-4.55l32.709-32.719  c6.074-6.075,6.074-15.909,0-21.986L285.08,230.397z"/>
						</svg>
						</button>
					</DialogPanel>
				</div>
			</div>
		</Dialog>
	</TransitionRoot>
</template>

<script setup>
import { Dialog, DialogPanel } from '@headlessui/vue'

const props = defineProps({
	hasOverscroll: {
		type: Boolean,
		default: true,
	},
	modalId: {
		type: String,
		default: '',
	},
})
</script>
