function generateScreens(screenSizes) {
	const getPx = (val) => `${val}px`
	const screenEntries = Object.entries(screenSizes)

	const minWidthBreakpoints = screenEntries.reduce(
		(acc, [name, width]) => ({
			...acc,
			[name]: getPx(width),
		}),
		{}
	)
	const maxWidthBreakpoints = screenEntries.reduce(
		(acc, [name, width]) => ({
			...acc,
			[`to-${name}`]: { max: getPx(width - 1) },
		}),
		{}
	)

	let prevBreakpointWidth = null
	const onlyBreakpoints = screenEntries
		.reverse()
		.reduce((acc, [name, width]) => {
			const isFirst = prevBreakpointWidth === null

			const key = name + '-only'
			const value = isFirst
				? { max: getPx(width) }
				: { min: getPx(width), max: getPx(prevBreakpointWidth - 1) }

			prevBreakpointWidth = width

			return { ...acc, [key]: value }
		}, {})

	return { ...minWidthBreakpoints, ...maxWidthBreakpoints, ...onlyBreakpoints }
}

module.exports = {
	generateScreens,
}
