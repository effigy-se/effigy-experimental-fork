#define DEFAULT_SPRITE_LIST "default_sprites"

/datum/controller/subsystem/accessories
	var/list/tails_list_anthro
	var/list/bodypart_markings = list()
	var/list/bodypart_markings_per_limb
	var/list/cached_mutant_sprite_accessories = list()
	var/list/markings_per_limb = list()
	var/static/list/marking_zones = list(
		BODY_ZONE_HEAD,
		BODY_ZONE_CHEST,
		BODY_ZONE_L_LEG,
		BODY_ZONE_R_LEG,
		BODY_ZONE_L_ARM,
		BODY_ZONE_R_ARM,
		BODY_ZONE_PRECISE_L_HAND,
		BODY_ZONE_PRECISE_R_HAND,
	)
	var/static/list/marking_zones_to_bitflag = list(
		BODY_ZONE_HEAD = HEAD,
		BODY_ZONE_CHEST = CHEST,
		BODY_ZONE_L_LEG = LEG_LEFT,
		BODY_ZONE_R_LEG = LEG_RIGHT,
		BODY_ZONE_L_ARM = ARM_LEFT,
		BODY_ZONE_R_ARM = ARM_RIGHT,
		BODY_ZONE_PRECISE_L_HAND = HAND_LEFT,
		BODY_ZONE_PRECISE_R_HAND = HAND_RIGHT
	)

/datum/controller/subsystem/accessories/setup_lists()
	. = ..()
	tails_list_anthro = init_sprite_accessory_subtypes(/datum/sprite_accessory/tails/anthro, add_blank = TRUE)[DEFAULT_SPRITE_LIST]
	init_bodypart_markings()

/datum/controller/subsystem/accessories/proc/init_bodypart_markings()
	// Here we build the global list for all body markings
	for(var/path in subtypesof(/datum/bodypart_marking))
		var/datum/bodypart_marking/marking = path
		if(initial(marking.name))
			marking = new path()
			bodypart_markings[marking.name] = marking
			//We go through all the possible affected bodyparts and a name reference where applicable
			for(var/marking_zone in SSaccessories.marking_zones)
				var/bitflag = SSaccessories.marking_zones_to_bitflag[marking_zone]
				if(marking.affected_bodyparts & bitflag)
					if(!SSaccessories.markings_per_limb[marking_zone])
						SSaccessories.markings_per_limb[marking_zone] = list()
					SSaccessories.markings_per_limb[marking_zone] += marking.name

#undef DEFAULT_SPRITE_LIST
