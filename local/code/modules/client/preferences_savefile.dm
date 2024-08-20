#define EXTENSIONS_SAVEFILE_VERSION_MAX 1

/datum/preferences/proc/load_effigy_character_data(list/save_data)
	if(!save_data)
		save_data = list()

	bodypart_markings = update_markings(SANITIZE_LIST(save_data["bodypart_markings"]))

/// Saves the modular customizations of a character on the savefile
/datum/preferences/proc/save_effigy_character_data(list/save_data)
	save_data["bodypart_markings"] = bodypart_markings
	save_data["extensions_version"] = EXTENSIONS_SAVEFILE_VERSION_MAX

/datum/preferences/proc/update_markings(list/markings)
	if(islist(markings))
		for(var/marking in markings)
			for(var/title in markings[marking])
				if(!islist(markings[marking][title]))
					markings[marking][title] = list(sanitize_hexcolor(markings[marking][title]), FALSE)
	return markings

#undef EXTENSIONS_SAVEFILE_VERSION_MAX
