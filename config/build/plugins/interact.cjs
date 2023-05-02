function addInteract({ addVariant }) {
	// Adds interact variant that adds all of the hover/focus states in one class
	addVariant('interact', ['&:hover', '&:focus', '&:active', '&:focus-within']),
	// Group variant to allow for interact state based on parent hover
	addVariant('group-child-state',  ':merge(.group).interact &')
}

module.exports = {
	addInteract,
}