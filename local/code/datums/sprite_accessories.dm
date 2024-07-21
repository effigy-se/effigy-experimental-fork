/datum/sprite_accessory
	///When the color selection is DNA_COLOR, this is the DNA extension block that is read from a character to get the saved mutant part color.
	var/dna_color

/datum/sprite_accessory/ears
	icon = 'local/icons/mob/mutant/sprite_accessories/ears.dmi'
	dna_color = "dna_ear_color"

/datum/sprite_accessory/ears/cat
	name = "Normal"
	icon_state = "catnormal"
	hasinner = TRUE
	color_src = HAIR_COLOR

/datum/sprite_accessory/ears/cat/big
	name = "Big"
	icon_state = "catbig"
	hasinner = TRUE
	color_src = DNA_COLOR

/datum/sprite_accessory/ears/cat/eevee
	name = "Eevee"
	icon_state = "eevee"

/datum/sprite_accessory/ears/cat/perky
	name = "Perky"
	icon_state = "perky"

/datum/sprite_accessory/frills
	icon = 'local/icons/mob/mutant/sprite_accessories/frills.dmi'
	dna_color = "dna_frill_color"
	color_src = DNA_COLOR

/datum/sprite_accessory/frills/divinity
	name = "Divinity"
	icon_state = "divinity"

/datum/sprite_accessory/frills/horns
	name = "Horns"
	icon_state = "horns"

/datum/sprite_accessory/frills/hornsdouble
	name = "Horns Double"
	icon_state = "hornsdouble"

/datum/sprite_accessory/frills/big
	name = "Big"
	icon_state = "big"

/datum/sprite_accessory/tails/spineless
	icon = 'local/icons/mob/mutant/sprite_accessories/tails.dmi'
	dna_color = "dna_tail_color"
	color_src = DNA_COLOR

/datum/sprite_accessory/tails/spineless/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/tails/spineless/fennec
	name = "Fennec"
	icon_state = "fennec"

/datum/sprite_accessory/tails/spineless/kitsune
	name = "Kitsune"
	icon_state = "kitsune"

/datum/sprite_accessory/snouts
	dna_color = "dna_snout_color"
	color_src = DNA_COLOR

/datum/sprite_accessory/horns
	dna_color = "dna_horns_color"
	color_src = DNA_COLOR
