function addInteract({ addVariant }) {
	addVariant('interact', ['&:hover', '&:focus', '&:active', '&:focus-within']),
	addVariant('group-child-state',  ':merge(.group).interact &')
}

module.exports = {
	addInteract,
}