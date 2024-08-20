/datum/sprite_accessory
	var/feature_key = null
	///When the color selection is DNA_INDEX_COLOR, this is the DNA extension block that is read from a character to get the saved mutant part color.
	var/dna_color
	var/list/accessory_layers
	var/list/color_channels

/datum/sprite_accessory/New()
	if(color_src == DNA_INDEX_COLOR)
		color_channels = list()
		if(!SSaccessories.cached_mutant_sprite_accessories[icon])
			SSaccessories.cached_mutant_sprite_accessories[icon] = icon_states(new /icon(icon))
		for(var/layer in accessory_layers)
			var/layer_state = layer == BODY_BEHIND_LAYER ? "BEHIND" : (layer == BODY_ADJ_LAYER ? "ADJ" : "FRONT")
			if("m_[feature_key]_[icon_state]_[layer_state]_primary" in SSaccessories.cached_mutant_sprite_accessories[icon])
				color_channels["1"] = "primary"
			if("m_[feature_key]_[icon_state]_[layer_state]_secondary" in SSaccessories.cached_mutant_sprite_accessories[icon])
				color_channels["2"] = "secondary"
			if("m_[feature_key]_[icon_state]_[layer_state]_tertiary" in SSaccessories.cached_mutant_sprite_accessories[icon])
				color_channels["3"] = "tertiary"

/datum/sprite_accessory/ears/cat
	icon = 'local/icons/mob/mutant/sprite_accessories/ears.dmi'
	feature_key = "ears"
	dna_color = "dna_ears_color"
	color_src = DNA_INDEX_COLOR
	accessory_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/ears/cat/tajaran/catbig
	name = "Cat, Big"
	icon_state = "catbig"

/datum/sprite_accessory/ears/cat/tajaran/catnormal
	name = "Cat, normal"
	icon_state = "catnormal"

/datum/sprite_accessory/ears/cat/eevee
	name = "Eevee"
	icon_state = "eevee"

/datum/sprite_accessory/ears/cat/fennec
	name = "Fennec"
	icon_state = "fennec"

/datum/sprite_accessory/ears/cat/husky
	name = "Husky"
	icon_state = "wolf"

/datum/sprite_accessory/tails/anthro
	icon = 'local/icons/mob/mutant/sprite_accessories/tails.dmi'
	feature_key = "tail_anthro"
	dna_color = "dna_tail_color"
	color_src = DNA_INDEX_COLOR
	accessory_layers = list(BODY_BEHIND_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/tails/anthro/none
	name = "None"
	icon_state = "none"

/datum/sprite_accessory/tails/anthro/fennec
	name = "Fennec"
	icon_state = "fennec"

/datum/sprite_accessory/tails/anthro/murid
	name = "Murid"
	icon_state = "murid"

/datum/sprite_accessory/tails/anthro/murid_two
	name = "Murid Alt"
	icon_state = "murid_two"

/datum/sprite_accessory/tails/anthro/shark
	name = "Shark"
	icon_state = "shark"

/datum/sprite_accessory/tails/anthro/hawk
	name = "Hawk"
	icon_state = "hawk"

/datum/sprite_accessory/tails/anthro/otie
	name = "Otie"
	icon_state = "otie"

/datum/sprite_accessory/tails/anthro/australian_shepherd
	name = "Australian Shepherd"
	icon_state = "australianshepherd"

/datum/sprite_accessory/tails/anthro/wah
	name = "Wah"
	icon_state = "wah"

/datum/sprite_accessory/tails/anthro/guilmon
	name = "Guilmon"
	icon_state = "guilmon"

/datum/sprite_accessory/tails/anthro/rabbit
	name = "Rabbit"
	icon_state = "rabbit"

/datum/sprite_accessory/tails/anthro/sabresun
	name = "Sabresun"
	icon_state = "sabresun"

/datum/sprite_accessory/tails/anthro/sergal
	name = "Sergal"
	icon_state = "sergal"

/datum/sprite_accessory/tails/anthro/tiger
	name = "Tiger"
	icon_state = "tiger"

/datum/sprite_accessory/tails/anthro/eevee
	name = "Eevee"
	icon_state = "eevee"

/datum/sprite_accessory/tails/anthro/husky
	name = "Husky"
	icon_state = "husky"

/datum/sprite_accessory/tails/anthro/leopard
	name = "Leopard"
	icon_state = "leopard"

/datum/sprite_accessory/frills
	dna_color = "dna_frills_color"
	feature_key = "frills"
	//color_src = DNA_INDEX_COLOR
	accessory_layers = list(BODY_ADJ_LAYER)

/datum/sprite_accessory/snouts
	dna_color = "dna_snout_color"
	feature_key = "snout"
	color_src = DNA_INDEX_COLOR
	accessory_layers = list(BODY_ADJ_LAYER, BODY_FRONT_LAYER)

/datum/sprite_accessory/snouts/anthro
	icon = 'local/icons/mob/mutant/sprite_accessories/snouts.dmi'

/datum/sprite_accessory/snouts/anthro/husky
	name = "Husky"
	icon_state = "husky"

/datum/sprite_accessory/snouts/anthro/rhino
	name = "Horn"
	icon_state = "rhino"

/datum/sprite_accessory/snouts/anthro/rodent
	name = "Rodent"
	icon_state = "rodent"

/datum/sprite_accessory/snouts/anthro/vulpkanin/lcanid
	name = "anthro, Long"
	icon_state = "lcanid"

/datum/sprite_accessory/snouts/anthro/lcanidalt
	name = "anthro, Long ALT"
	icon_state = "lcanidalt"

/datum/sprite_accessory/snouts/anthro/vulpkanin/lcanidstriped
	name = "anthro, Long, Striped"
	icon_state = "lcanidstripe"

/datum/sprite_accessory/snouts/anthro/lcanidstripedalt
	name = "anthro, Long, Striped ALT"
	icon_state = "lcanidstripealt"

/datum/sprite_accessory/snouts/anthro/tajaran/scanid
	name = "anthro, Short"
	icon_state = "scanid"

/datum/sprite_accessory/snouts/anthro/tajaran/scanidalt
	name = "anthro, Short ALT"
	icon_state = "scanidalt"

/datum/sprite_accessory/snouts/anthro/tajaran/scanidalt2
	name = "anthro, Short ALT 2"
	icon_state = "scanidalt2"

/datum/sprite_accessory/snouts/anthro/tajaran/scanidalt3
	name = "anthro, Short ALT 3"
	icon_state = "scanidalt3"

/datum/sprite_accessory/snouts/anthro/tajaran/normal
	name = "Tajaran, normal (Single)"
	icon_state = "ntajaran"
	color_src = DNA_INDEX_COLOR

/datum/sprite_accessory/snouts/anthro/wolf
	name = "anthro, Thick"
	icon_state = "wolf"

/datum/sprite_accessory/snouts/anthro/wolfalt
	name = "anthro, Thick ALT"
	icon_state = "wolfalt"

/datum/sprite_accessory/snouts/anthro/otie
	name = "Otie"
	icon_state = "otie"

/datum/sprite_accessory/snouts/anthro/otiesmile
	name = "Otie Smile"
	icon_state = "otiesmile"
