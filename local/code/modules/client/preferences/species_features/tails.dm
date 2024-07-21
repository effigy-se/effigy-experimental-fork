/datum/preference/choiced/tail_spineless
	savefile_key = "feature_spineless_tail"
	savefile_identifier = PREFERENCE_CHARACTER
	category = PREFERENCE_CATEGORY_FEATURES
	main_feature_name = "Tail"
	should_generate_icons = TRUE
	relevant_external_organ = /obj/item/organ/external/tail/spineless

/datum/preference/choiced/tail_spineless/compile_constant_data()
	var/list/data = ..()

	data[SUPPLEMENTAL_FEATURE_KEY] = "dna_tail_color"

	return data

/datum/preference/choiced/tail_spineless/icon_for(value)
	return generate_icon_with_tails_accessory(SSaccessories.tails_list_spineless[value])

/datum/preference/choiced/tail_spineless/create_default_value()
	var/datum/sprite_accessory/tails/spineless/tail = /datum/sprite_accessory/tails/spineless/fennec
	return initial(tail.name)

/datum/preference/choiced/tail_spineless/init_possible_values()
	return assoc_to_keys_features(SSaccessories.tails_list_spineless)

/datum/preference/choiced/tail_spineless/apply_to_human(mob/living/carbon/human/target, value)
	target.dna.features["tail_spineless"] = value

/proc/generate_icon_with_tails_accessory(datum/sprite_accessory/sprite_accessory, y_offset = 0)
	var/static/icon/head_icon
	if (isnull(head_icon))
		head_icon = icon('icons/mob/human/bodyparts_greyscale.dmi', "human_head_m")
		head_icon.Blend(skintone2hex("caucasian1"), ICON_MULTIPLY)

	var/icon/final_icon = new(head_icon)
	if (!isnull(sprite_accessory))
		ASSERT(istype(sprite_accessory))

		var/icon/head_accessory_icon = icon(sprite_accessory.icon, "m_tail_spineless_[sprite_accessory.icon_state]_BEHIND_primary", SOUTH)
		if(y_offset)
			head_accessory_icon.Shift(NORTH, y_offset)
		head_accessory_icon.Blend(COLOR_DARK_BROWN, ICON_MULTIPLY)
		final_icon.Blend(head_accessory_icon, ICON_OVERLAY)

		if(sprite_accessory.hasinner)
			var/icon/inner_accessory_icon = icon(sprite_accessory.icon, "m_tail_spineless_[sprite_accessory.icon_state]_BEHIND_secondary", SOUTH)
			if(y_offset)
				inner_accessory_icon.Shift(NORTH, y_offset)
			inner_accessory_icon.Blend(COLOR_DARK_BROWN, ICON_MULTIPLY)
			final_icon.Blend(inner_accessory_icon, ICON_OVERLAY)

	final_icon.Crop(10, 19, 22, 31)
	final_icon.Scale(32, 32)

	return final_icon
