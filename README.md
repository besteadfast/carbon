# Stallion

Steadfast's starter project - Craft CMS, Webpack, and Docker

## Interact Variant State

To add the same class for hover, focus, focus-within, and active, use the :interact state.

Styling with the varaint

```<a class="text-black interact:text-white" href="#">Read more</a>```

vs default tailwind styling

```<a class="text-black hover:text-white focus:text-white active:text-white" href="#">Read more</a>```

Interact variant state also includes a group state to allow for users to add states based on parent interact

To do so, use the group class on the parent and the group-interact variant on the child.

Styling using the :interact variant & group-interact

```<a class="group" href="#"><span class="text-black group-interact:text-white">Read more</span></a>```

vs default tailwind styling

```<a class="group" href="#"><span class="text-black group-hover:text-white group-focus:text-white group-active:text-white">Read more</span></a>```

A real world example of this is also on the Stallion homepage for review purposes.