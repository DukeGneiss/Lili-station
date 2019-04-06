///////////////////////////////////////////////////////////////////////////////////
datum
	chemical_reaction
		var/name = null
		var/id = null
		var/result = null
		var/list/secondary_results = new/list()
		var/list/required_reagents = new/list()
		var/list/required_catalysts = new/list()

		// Both of these variables are mostly going to be used with Metroid cores - but if you want to, you can use them for other things
		var/atom/required_container = null // the container required for the reaction to happen
		var/required_other = 0 // an integer required for the reaction to happen

		var/result_amount = 0
		var/secondary = 0 // set to nonzero if secondary reaction

		var/requires_heating = 0	//to avoid lag and other complications, every recipe is restricted to the same heating time (or none)

		proc
			on_reaction(var/datum/reagents/holder, var/created_volume)
				return

		homunculinus
			name = "homunculinus"
			id = "homunculinus"
			result = "homunculinus"
			required_reagents = list("nutriments" = 1, "milk" = 1)
			result_amount = 5

			on_reaction(var/datum/reagents/holder, var/created_volume)
				world << "PIZDEC"

		explosion
			name = "explosion"
			id = "explosion"
			result = "explosion"
			required_reagents = list("potassium" = 5, "water" = 5)
			result_amount = 1

			on_reaction(var/datum/reagents/holder, var/created_volume)
				boom(rand(1,2), holder.my_atom.loc)

		smoke
			name = "smoke"
			id = "smoke"
			result = "smoke"
			required_reagents = list("potassium" = 5, "sugar" = 5, "phosphorus" = 5)
			result_amount = 1

			on_reaction(var/datum/reagents/holder, var/created_volume)
				for(var/turf/simulated/floor/F in range(3, holder.my_atom.loc))
					new /obj/effect/smoke(F)