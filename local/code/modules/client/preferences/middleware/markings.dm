#define ORGANS_DEFAULT_NAME "Default"
#define LIMBS_DEFAULT_NAME "None"

/datum/preference_middleware/limbs_and_markings
	action_delegations = list(
		//"set_limb_aug" = PROC_REF(set_limb_aug),
		//"set_limb_aug_style" = PROC_REF(set_limb_aug_style),
		"add_marking" = PROC_REF(add_marking),
		"change_marking" = PROC_REF(change_marking),
		"color_marking" = PROC_REF(color_marking),
		"remove_marking" = PROC_REF(remove_marking),
		//"set_organ_aug" = PROC_REF(set_organ_aug),
		//"set_preset" = PROC_REF(set_preset),
		//"change_emissive" = PROC_REF(change_emissive_marking),
	)
	var/list/limbs_to_process = list(
		"l_arm" = "Left Arm",
		"r_arm" = "Right Arm",
		"l_leg" = "Left Leg",
		"r_leg" = "Right Leg",
		"chest" = "Chest",
		"head" = "Head",
		"l_hand" = "Left Hand",
		"r_hand" = "Right Hand"
	)
/*
	var/list/organs_to_process = list(
		"heart" = "Heart",
		"lungs" = "Lungs",
		"liver" = "Liver",
		"stomach" = "Stomach",
		"eyes" = "Eyes",
		"tongue" = "Tongue",
		"Mouth implant" = "Mouth implant"
	)

	var/list/aug_support = list(
		"l_arm" = TRUE,
		"r_arm" = TRUE,
		"l_leg" = TRUE,
		"r_leg" = TRUE,
		"chest" = TRUE,
		"head" = TRUE,
		"l_hand" = FALSE,
		"r_hand" = FALSE,
	)
	var/list/nice_aug_names = list()
	var/list/augment_to_path = list()
	var/list/costs = list(
		AUGMENT_CATEGORY_LIMBS = list(),
		AUGMENT_CATEGORY_ORGANS = list(),
	)
	var/list/robotic_styles
*/

/datum/preference_middleware/limbs_and_markings/apply_to_human(mob/living/carbon/human/target, datum/preferences/preferences, visuals_only = FALSE)
	target.dna.species.body_markings = LAZYCOPY(preferences.bodypart_markings)

	target.synchronize_bodytypes() // We call this here to ensure that by this point, bodytypes are synchronized, after all changes to the limbs.
	target.synchronize_bodyshapes()

	// We don't need to go any further if this isn't visuals only, as we will have fully replaced each limb
	// affected by a limb augmentation.
	if(!visuals_only)
		return

	for(var/body_zone in list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG, BODY_ZONE_CHEST, BODY_ZONE_HEAD))
		var/obj/item/bodypart/target_bodypart = target.get_bodypart(body_zone)
		target_bodypart?.reset_appearance()


/datum/preference_middleware/limbs_and_markings/proc/fix_colors_on_markings_to_tgui(markings_list, limb_slot)
	var/list/fixed_markings = list()
	var/marking_count = 0
	for(var/marking in markings_list)
		var/name = marking
		var/color = markings_list[name][1]
		var/emissive = markings_list[name][2]
		marking_count++
		fixed_markings += list(list("name" = name, "color" = sanitize_hexcolor(color), "marking_id" = "[limb_slot]_[marking_count]", "emissive" = emissive))
	return fixed_markings

/datum/preference_middleware/limbs_and_markings/proc/add_marking(list/params, mob/user)
	var/limb_slot = params["limb_slot"]
	if(!preferences.bodypart_markings[limb_slot])
		preferences.bodypart_markings[limb_slot] = list()
	if(preferences.bodypart_markings[limb_slot].len >= MAXIMUM_MARKINGS_PER_LIMB)
		return
	preferences.bodypart_markings[limb_slot] += list(SSaccessories.markings_per_limb[limb_slot][1] = list("#FFFFFF", FALSE)) // Default to the first in the list for the limb.
	preferences.character_preview_view.update_body()
	return TRUE

/datum/preference_middleware/limbs_and_markings/proc/change_marking(list/params, mob/user)
	var/limb_slot = params["limb_slot"]
	var/marking_id = params["marking_id"]
	var/marking_name = params["marking_name"]

	var/list/markings = preferences.bodypart_markings[limb_slot]
	var/list/new_markings = list()
	var/marking_count = 0
	for(var/marking_entry in markings)
		marking_count++
		if(marking_id == "[limb_slot]_[marking_count]")
			new_markings[marking_name] = markings[marking_entry] // gets the color from the old entry
			continue
		new_markings[marking_entry] = markings[marking_entry]
	preferences.bodypart_markings[limb_slot] = new_markings
	preferences.character_preview_view.update_body()
	return TRUE

/datum/preference_middleware/limbs_and_markings/proc/color_marking(list/params, mob/user)
	var/limb_slot = params["limb_slot"]
	var/marking_id = params["marking_id"]
	var/list/markings = preferences.bodypart_markings[limb_slot]
	var/list/new_markings = list()
	var/marking_count = 0
	var/marking_entry_name
	for(var/marking_entry in markings)
		marking_count++
		if(marking_id == "[limb_slot]_[marking_count]")
			marking_entry_name = marking_entry
		new_markings[marking_entry] = markings[marking_entry]
	var/new_color = input(
		usr,
		"Select new color",
		null,
		preferences.bodypart_markings[limb_slot][marking_entry_name],
	) as color | null
	if(!new_color)
		return TRUE
	new_markings[marking_entry_name][1] = sanitize_hexcolor(new_color) // gets the new color from the picker
	preferences.bodypart_markings[limb_slot] = new_markings
	preferences.character_preview_view.update_body()
	return TRUE

/datum/preference_middleware/limbs_and_markings/proc/remove_marking(list/params, mob/user)
	var/limb_slot = params["limb_slot"]
	var/marking_id = params["marking_id"]


	var/list/markings = preferences.bodypart_markings[limb_slot]
	var/list/new_markings = list()
	var/marking_count = 0
	for(var/marking_entry in markings)
		marking_count++
		if(marking_id == "[limb_slot]_[marking_count]")
			continue
		new_markings[marking_entry] = markings[marking_entry]
	preferences.bodypart_markings[limb_slot] = new_markings
	preferences.character_preview_view.update_body()
	return TRUE

/datum/preference_middleware/limbs_and_markings/get_ui_data(mob/user)
	var/list/data = list()
	var/list/limbs_data = list()
	for(var/limb in limbs_to_process)
		var/list/choices = SSaccessories.markings_per_limb[limb].Copy()
		limbs_data += list(list(
			"slot" = limb,
			"name" = limbs_to_process[limb],
			"markings" = list(
				"marking_choices" = choices,
				"markings_list" = fix_colors_on_markings_to_tgui(preferences.bodypart_markings[limb], limb)
			),
		))

	data["limbs_data"] = limbs_data

	return data

#undef LIMBS_DEFAULT_NAME
#undef ORGANS_DEFAULT_NAME
