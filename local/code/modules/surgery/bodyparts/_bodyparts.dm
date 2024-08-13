/obj/item/bodypart
	/// A list of all of our bodypart markings.
	var/list/bodypart_markings
	/// A list of all our aux zone markings (hands)
	var/list/aux_zone_markings
	/// The alpha override of our markings.
	//var/markings_alpha
	/// What is our normal limb ID? used for squashing legs.
	var/base_limb_id = SPECIES_ANTHRO
	/// The bodypart's currently applied style's name. Only necessary for bodyparts that come in multiple
	/// variants, like prosthetics and cyborg bodyparts.
	var/current_style = null

/// Body markings code
/obj/item/bodypart/get_limb_icon(dropped)
	. = ..()
	var/override_color
	var/atom/offset_spokesman = owner || src
	// First, check to see if this bodypart is husked. If so, we don't want to apply our sparkledog colors to the limb.
	if(is_husked)
		override_color = "#888888"
	// We need to check that the owner exists(could be a placed bodypart) and that it's not a chainsawhand and that they're a human with usable DNA.
	if(!(bodypart_flags & BODYPART_PSEUDOPART))
		for(var/key in bodypart_markings) // Cycle through all of our currently selected markings.
			var/datum/bodypart_marking/body_marking = SSaccessories.bodypart_markings[key]
			if(!body_marking) // Edge case prevention.
				continue

			var/render_limb_string = limb_id == "digitigrade" ? ("digitigrade_1_" + body_zone) : body_zone // I am not sure why there are _1 and _2 versions of digi, so, it's staying like this.

			var/gender_modifier = ""
			if(body_zone == BODY_ZONE_CHEST) // Chest markings have male and female versions.
				if(!body_marking.gender_neutral)
					gender_modifier = is_dimorphic ? "_[limb_gender]" : "_m"

			var/mutable_appearance/accessory_overlay
			var/mutable_appearance/emissive
			accessory_overlay = mutable_appearance(body_marking.icon, "[body_marking.icon_state]_[render_limb_string][gender_modifier]", -BODYPARTS_LAYER)
			if(bodypart_markings[key][2])
				//emissive = emissive_appearance_copy(accessory_overlay, offset_spokesman)
			if(override_color)
				accessory_overlay.color = override_color
			else
				accessory_overlay.color = bodypart_markings[key][1]
			. += accessory_overlay
			if (emissive)
				. += emissive

		if(aux_zone)
			for(var/key in aux_zone_markings)
				var/datum/bodypart_marking/body_marking = SSaccessories.bodypart_markings[key]
				if (!body_marking) // Edge case prevention.
					continue

				var/render_limb_string = aux_zone

				var/mutable_appearance/emissive
				var/mutable_appearance/accessory_overlay
				accessory_overlay = mutable_appearance(body_marking.icon, "[body_marking.icon_state]_[render_limb_string]", -aux_layer)
				if (aux_zone_markings[key][2])
					//emissive = emissive_appearance_copy(accessory_overlay, offset_spokesman)
				if(override_color)
					accessory_overlay.color = override_color
				else
					accessory_overlay.color = aux_zone_markings[key][1]
				. += accessory_overlay
				if (emissive)
					. += emissive

	return .
