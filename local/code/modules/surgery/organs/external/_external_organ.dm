/datum/bodypart_overlay/mutant/frills
	color_source = ORGAN_COLOR_DNA

/datum/bodypart_overlay/mutant/snout
	color_source = ORGAN_COLOR_DNA

/datum/bodypart_overlay/mutant/horns
	color_source = ORGAN_COLOR_DNA

/obj/item/organ/external/tail/spineless
	name = "tail"
	preference = "feature_spineless_tail"
	bodypart_overlay = /datum/bodypart_overlay/mutant/tail/spineless
	dna_block = DNA_SPINELESS_TAIL_BLOCK
	wag_flags = NONE

/obj/item/organ/external/tail/spineless/get_butt_sprite()
	return icon('icons/mob/butts.dmi', BUTT_SPRITE_CAT)

/// bodypart overlay
/datum/bodypart_overlay/mutant/tail/spineless
	feature_key = "tail_spineless"
	color_source = ORGAN_COLOR_DNA

/datum/bodypart_overlay/mutant/tail/spineless/get_global_feature_list()
	return SSaccessories.tails_list_spineless


