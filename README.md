# Stallion

Steadfast's starter project - Craft CMS, Webpack, and Docker

## Interact Variant State

To add the same class for hover, focus, focus-within, and active, use the :interact state.

Styling with the varaint

```<a class="text-black interact:text-white" href="#">Read more</a>```

vs default tailwind styling

```<a class="text-black hover:text-white focus:text-white active:text-white" href="#">Read more</a>```

Interact variant state also includes a group state to allow for users to add states based on parent interact

To do so, use the group class on the parent, and the group-child-state along with the custom interact variant on the child.

Styling using the :interact variant & group-child-state

```<a class="group interact" href="#"><span class="text-black group-child-state:interact:text-white">Read more</span></a>```

vs default tailwind styling

```<a class="group" href="#"><span class="text-black group-hover:text-white group-focus:text-white group-active:text-white">Read more</span></a>```

^ the above group variant is necessary because tailwind does not support custom variants with groups. This lets you use the interact custom state on the child but target the parent hover. An example use case would be changing a child icon color when you hover over the parent ```<a></a>``` tag.