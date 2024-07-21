/// General mutant bodyparts. Used in most mutant species.
/obj/item/bodypart/head/mutant
	icon_greyscale = BODYPART_ICON_ANIMALID
	limb_id = SPECIES_ANIMALID
	head_flags = HEAD_ALL_FEATURES

/obj/item/bodypart/chest/mutant
	icon_greyscale = BODYPART_ICON_ANIMALID
	limb_id = SPECIES_ANIMALID
	is_dimorphic = TRUE

/obj/item/bodypart/arm/left/mutant
	icon_greyscale = BODYPART_ICON_ANIMALID
	limb_id = SPECIES_ANIMALID
	unarmed_attack_verbs = list("slash")
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'

/obj/item/bodypart/arm/right/mutant
	icon_greyscale = BODYPART_ICON_ANIMALID
	limb_id = SPECIES_ANIMALID
	unarmed_attack_verbs = list("slash")
	unarmed_attack_effect = ATTACK_EFFECT_CLAW
	unarmed_attack_sound = 'sound/weapons/slash.ogg'
	unarmed_miss_sound = 'sound/weapons/slashmiss.ogg'

/obj/item/bodypart/leg/left/mutant
	icon_greyscale = BODYPART_ICON_ANIMALID
	limb_id = SPECIES_ANIMALID

/obj/item/bodypart/leg/right/mutant
	icon_greyscale = BODYPART_ICON_ANIMALID
	limb_id = SPECIES_ANIMALID
