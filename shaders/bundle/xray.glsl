#include "/settings/xray.glsl"

#include "/bundle/block.glsl"
#include "/enum/includestate.glsl"
#include "/enum/state.glsl"
#include "/enum/setbase.glsl"

#define XRAY_SET_MISC 		20001
#define XRAY_SET_LIQUIDS 	20002
#define XRAY_SET_CUSTOM 	20003

bool shouldXray(int blockID) {
	if(
	#ifdef XRAY_USE_SET_MISC
		blockID == XRAY_SET_MISC ||
	#endif
	#ifdef XRAY_USE_SET_LIQUIDS
		blockID == XRAY_SET_LIQUIDS ||
	#endif
	#ifdef XRAY_USE_SET_CUSTOM
		blockID == XRAY_SET_CUSTOM ||
	#endif
	false)
		return true;
	
	if(!IS_ORE(blockID))
		return false;
	
	bool included = false;
	
	#if XRAY_ENABLED == STATE_ENABLED
		#ifdef XRAY_BASIC_USE_KNOWN_ORE
			if (IS_KNOWN_ORE(blockID) && GET_KNOWN_ORE(blockID) == XRAY_BASIC_KNOWN_ORE)
		#endif
		#ifdef XRAY_BASIC_USE_MODID
			if (GET_MODID(blockID) == XRAY_BASIC_MODID)
		#endif
			included = true;
	#elif XRAY_ENABLED == STATE_ADVANCED

		#if XRAY_BASE_SET == SET_ALL
			included = true;
		#endif
		
		if(IS_KNOWN_ORE(blockID))
		switch (GET_KNOWN_ORE(blockID)) {
			#/**/define _GROUP_STATE	XRAY_GROUP_IRON
			#/**/define _GROUP			IRON
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
			
			#/**/define _GROUP_STATE	XRAY_GROUP_GOLD
			#/**/define _GROUP			GOLD
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
			
			#/**/define _GROUP_STATE	XRAY_GROUP_DIAMOND
			#/**/define _GROUP			DIAMOND
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
			
			#/**/define _GROUP_STATE	XRAY_GROUP_COAL
			#/**/define _GROUP			COAL
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
			
			#/**/define _GROUP_STATE	XRAY_GROUP_EMERALD
			#/**/define _GROUP			EMERALD
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
			
			#/**/define _GROUP_STATE	XRAY_GROUP_LAPIS
			#/**/define _GROUP			LAPIS
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
			
			#/**/define _GROUP_STATE	XRAY_GROUP_REDSTONE
			#/**/define _GROUP			REDSTONE
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
			
			#/**/define _GROUP_STATE	XRAY_GROUP_QUARTZ
			#/**/define _GROUP			QUARTZ
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
			
			#/**/define _GROUP_STATE	XRAY_GROUP_COPPER
			#/**/define _GROUP			COPPER
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
			
			#/**/define _GROUP_STATE	XRAY_GROUP_TIN
			#/**/define _GROUP			TIN
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
			
			#/**/define _GROUP_STATE	XRAY_GROUP_LEAD
			#/**/define _GROUP			LEAD
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
			
			#/**/define _GROUP_STATE	XRAY_GROUP_SILVER
			#/**/define _GROUP			SILVER
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
			
			#/**/define _GROUP_STATE	XRAY_GROUP_ALUMINUM
			#/**/define _GROUP			ALUMINUM
			#if _GROUP_STATE != INHERIT
				case _GROUP:
					included = _GROUP_STATE == INCLUDE;
				break;
			#endif
			#undef _GROUP_STATE
			#undef _GROUP
		}
		
		switch (GET_MODID(blockID)) {
			#/**/define _MOD_STATE				XRAY_MODID_MINECRAFT
			#/**/define _MOD					MINECRAFT
			#if _MOD_STATE != INHERIT
				case _MOD:
					#if _MOD_STATE == INCLUDE
						included = true;
					#elif _MOD_STATE == EXCLUDE
						included = false;
					#elif _MOD_STATE == PARTIAL
						switch (blockID) {
							#/**/define _BLOCK_STATE	XRAY_SELECT_MINECRAFT_IRON_ORE
							#/**/define _BLOCK			BLOCK_MINECRAFT_IRON_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_MINECRAFT_GOLD_ORE
							#/**/define _BLOCK			BLOCK_MINECRAFT_GOLD_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_MINECRAFT_DIAMOND_ORE
							#/**/define _BLOCK			BLOCK_MINECRAFT_DIAMOND_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_MINECRAFT_COAL_ORE
							#/**/define _BLOCK			BLOCK_MINECRAFT_COAL_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_MINECRAFT_EMERALD_ORE
							#/**/define _BLOCK			BLOCK_MINECRAFT_EMERALD_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_MINECRAFT_LAPIS_ORE
							#/**/define _BLOCK			BLOCK_MINECRAFT_LAPIS_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_MINECRAFT_REDSTONE_ORE
							#/**/define _BLOCK			BLOCK_MINECRAFT_REDSTONE_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_MINECRAFT_QUARTZ_ORE
							#/**/define _BLOCK			BLOCK_MINECRAFT_QUARTZ_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK

							#/**/define _BLOCK_STATE	XRAY_SELECT_MINECRAFT_COPPER_ORE
							#/**/define _BLOCK			BLOCK_MINECRAFT_COPPER_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
						}
					#endif
				break;
			#endif
			#undef _MOD_STATE
			#undef _MOD
			
			#/**/define _MOD_STATE				XRAY_MODID_INDUSTRIAL_CRAFT
			#/**/define _MOD					INDUSTRIAL_CRAFT
			#if _MOD_STATE != INHERIT
				case _MOD:
					#if _MOD_STATE == INCLUDE
						included = true;
					#elif _MOD_STATE == EXCLUDE
						included = false;
					#elif _MOD_STATE == PARTIAL
						switch (blockID) {
							#/**/define _BLOCK_STATE	XRAY_SELECT_INDUSTRIAL_CRAFT_COPPER_ORE
							#/**/define _BLOCK			BLOCK_INDUSTRIAL_CRAFT_COPPER_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_INDUSTRIAL_CRAFT_TIN_ORE
							#/**/define _BLOCK			BLOCK_INDUSTRIAL_CRAFT_TIN_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_INDUSTRIAL_CRAFT_URAN_ORE
							#/**/define _BLOCK			BLOCK_INDUSTRIAL_CRAFT_URAN_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_INDUSTRIAL_CRAFT_LEAD_ORE
							#/**/define _BLOCK			BLOCK_INDUSTRIAL_CRAFT_LEAD_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
						}
					#endif
				break;
			#endif
			#undef _MOD_STATE
			#undef _MOD
			
			#/**/define _MOD_STATE				XRAY_MODID_IMMERSIVE_ENGINEERING
			#/**/define _MOD					IMMERSIVE_ENGINEERING
			#if _MOD_STATE != INHERIT
				case _MOD:
					#if _MOD_STATE == INCLUDE
						included = true;
					#elif _MOD_STATE == EXCLUDE
						included = false;
					#elif _MOD_STATE == PARTIAL
						switch (blockID) {
							#/**/define _BLOCK_STATE	XRAY_SELECT_IMMERSIVE_ENGINEERING_COPPER_ORE
							#/**/define _BLOCK			BLOCK_IMMERSIVE_ENGINEERING_COPPER_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_IMMERSIVE_ENGINEERING_BAUXITE_ORE
							#/**/define _BLOCK			BLOCK_IMMERSIVE_ENGINEERING_BAUXITE_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_IMMERSIVE_ENGINEERING_LEAD_ORE
							#/**/define _BLOCK			BLOCK_IMMERSIVE_ENGINEERING_LEAD_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_IMMERSIVE_ENGINEERING_SILVER_ORE
							#/**/define _BLOCK			BLOCK_IMMERSIVE_ENGINEERING_SILVER_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_IMMERSIVE_ENGINEERING_NICKEL_ORE
							#/**/define _BLOCK			BLOCK_IMMERSIVE_ENGINEERING_NICKEL_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
						}
					#endif
				break;
			#endif
			#undef _MOD_STATE
			#undef _MOD
			
			#/**/define _MOD_STATE				XRAY_MODID_MEKANISM
			#/**/define _MOD					MEKANISM
			#if _MOD_STATE != INHERIT
				case _MOD:
					#if _MOD_STATE == INCLUDE
						included = true;
					#elif _MOD_STATE == EXCLUDE
						included = false;
					#elif _MOD_STATE == PARTIAL
						switch (blockID) {
							#/**/define _BLOCK_STATE	XRAY_SELECT_MEKANISM_OSMIUM_ORE
							#/**/define _BLOCK			BLOCK_MEKANISM_OSMIUM_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_MEKANISM_COPPER_ORE
							#/**/define _BLOCK			BLOCK_MEKANISM_COPPER_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_MEKANISM_TIN_ORE
							#/**/define _BLOCK			BLOCK_MEKANISM_TIN_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
						}
					#endif
				break;
			#endif
			#undef _MOD_STATE
			#undef _MOD
			
			#/**/define _MOD_STATE				XRAY_MODID_DRACONIC_EVOLUTION
			#/**/define _MOD					DRACONIC_EVOLUTION
			#if _MOD_STATE != INHERIT
				case _MOD:
					#if _MOD_STATE == INCLUDE
						included = true;
					#elif _MOD_STATE == EXCLUDE
						included = false;
					#elif _MOD_STATE == PARTIAL
						switch (blockID) {
							#/**/define _BLOCK_STATE	XRAY_SELECT_DRACONIC_EVOLUTION_DRACONIUM_ORE
							#/**/define _BLOCK			BLOCK_DRACONIC_EVOLUTION_DRACONIUM_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
						}
					#endif
				break;
			#endif
			#undef _MOD_STATE
			#undef _MOD
			
			#/**/define _MOD_STATE				XRAY_MODID_THERMAL_FOUNDATION
			#/**/define _MOD					THERMAL_FOUNDATION
			#if _MOD_STATE != INHERIT
				case _MOD:
					#if _MOD_STATE == INCLUDE
						included = true;
					#elif _MOD_STATE == EXCLUDE
						included = false;
					#elif _MOD_STATE == PARTIAL
						switch (blockID) {
							#/**/define _BLOCK_STATE	XRAY_SELECT_THERMAL_FOUNDATION_COPPER_ORE
							#/**/define _BLOCK			BLOCK_THERMAL_FOUNDATION_COPPER_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_THERMAL_FOUNDATION_TIN_ORE
							#/**/define _BLOCK			BLOCK_THERMAL_FOUNDATION_TIN_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_THERMAL_FOUNDATION_SILVER_ORE
							#/**/define _BLOCK			BLOCK_THERMAL_FOUNDATION_SILVER_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_THERMAL_FOUNDATION_LEAD_ORE
							#/**/define _BLOCK			BLOCK_THERMAL_FOUNDATION_LEAD_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_THERMAL_FOUNDATION_FERROUS_ORE
							#/**/define _BLOCK			BLOCK_THERMAL_FOUNDATION_FERROUS_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_THERMAL_FOUNDATION_SHINY_ORE
							#/**/define _BLOCK			BLOCK_THERMAL_FOUNDATION_SHINY_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_THERMAL_FOUNDATION_MANA_INFISED_ORE
							#/**/define _BLOCK			BLOCK_THERMAL_FOUNDATION_MANA_INFISED_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
						}
					#endif
				break;
			#endif
			#undef _MOD_STATE
			#undef _MOD
			
			#/**/define _MOD_STATE				XRAY_MODID_BIG_REACTORS
			#/**/define _MOD					BIG_REACTORS
			#if _MOD_STATE != INHERIT
				case _MOD:
					#if _MOD_STATE == INCLUDE
						included = true;
					#elif _MOD_STATE == EXCLUDE
						included = false;
					#elif _MOD_STATE == PARTIAL
						switch (blockID) {
							#/**/define _BLOCK_STATE	XRAY_SELECT_BIG_REACTORS_YELLORITE_ORE
							#/**/define _BLOCK			BLOCK_BIG_REACTORS_YELLORITE_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
						}
					#endif
				break;
			#endif
			#undef _MOD_STATE
			#undef _MOD
			
			#/**/define _MOD_STATE				XRAY_MODID_APPLIED_ENERGISTICS
			#/**/define _MOD					APPLIED_ENERGISTICS
			#if _MOD_STATE != INHERIT
				case _MOD:
					#if _MOD_STATE == INCLUDE
						included = true;
					#elif _MOD_STATE == EXCLUDE
						included = false;
					#elif _MOD_STATE == PARTIAL
						switch (blockID) {
							#/**/define _BLOCK_STATE	XRAY_SELECT_APPLIED_ENERGISTICS_QUARTZ_ORE
							#/**/define _BLOCK			BLOCK_APPLIED_ENERGISTICS_QUARTZ_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_APPLIED_ENERGISTICS_CHARGED_QUARTZ_ORE
							#/**/define _BLOCK			BLOCK_APPLIED_ENERGISTICS_CHARGED_QUARTZ_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
						}
					#endif
				break;
			#endif
			#undef _MOD_STATE
			#undef _MOD
			
			#/**/define _MOD_STATE				XRAY_MODID_BIOMES_O_PLENTY
			#/**/define _MOD					BIOMES_O_PLENTY
			#if _MOD_STATE != INHERIT
				case _MOD:
					#if _MOD_STATE == INCLUDE
						included = true;
					#elif _MOD_STATE == EXCLUDE
						included = false;
					#elif _MOD_STATE == PARTIAL
						switch (blockID) {
							#/**/define _BLOCK_STATE	XRAY_SELECT_BLOCK_BIOMES_O_PLENTY_BIOME_BLOCK_ORE
							#/**/define _BLOCK			BLOCK_BIOMES_O_PLENTY_BIOME_BLOCK_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_BIOMES_O_PLENTY_ENDER_AMETHYST_ORE
							#/**/define _BLOCK			BLOCK_BIOMES_O_PLENTY_ENDER_AMETHYST_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_BIOMES_O_PLENTY_RUBY_ORE
							#/**/define _BLOCK			BLOCK_BIOMES_O_PLENTY_RUBY_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_BIOMES_O_PLENTY_PERIDOT_ORE
							#/**/define _BLOCK			BLOCK_BIOMES_O_PLENTY_PERIDOT_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_BIOMES_O_PLENTY_TOPAZ_ORE
							#/**/define _BLOCK			BLOCK_BIOMES_O_PLENTY_TOPAZ_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_BIOMES_O_PLENTY_TANZANITE_ORE
							#/**/define _BLOCK			BLOCK_BIOMES_O_PLENTY_TANZANITE_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_BIOMES_O_PLENTY_MALACHITE_ORE
							#/**/define _BLOCK			BLOCK_BIOMES_O_PLENTY_MALACHITE_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_BIOMES_O_PLENTY_SAPPHIRE_ORE
							#/**/define _BLOCK			BLOCK_BIOMES_O_PLENTY_SAPPHIRE_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_BIOMES_O_PLENTY_AMBER_ORE
							#/**/define _BLOCK			BLOCK_BIOMES_O_PLENTY_AMBER_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
						}
					#endif
				break;
			#endif
			#undef _MOD_STATE
			#undef _MOD
			
			#/**/define _MOD_STATE				XRAY_MODID_FORESTRY
			#/**/define _MOD					FORESTRY
			#if _MOD_STATE != INHERIT
				case _MOD:
					#if _MOD_STATE == INCLUDE
						included = true;
					#elif _MOD_STATE == EXCLUDE
						included = false;
					#elif _MOD_STATE == PARTIAL
						switch (blockID) {
							#/**/define _BLOCK_STATE	XRAY_SELECT_FORESTRY_APATITE_ORE
							#/**/define _BLOCK			BLOCK_FORESTRY_APATITE_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_FORESTRY_COPPER_ORE
							#/**/define _BLOCK			BLOCK_FORESTRY_COPPER_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_FORESTRY_TIN_ORE
							#/**/define _BLOCK			BLOCK_FORESTRY_TIN_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
						}
					#endif
				break;
			#endif
			#undef _MOD_STATE
			#undef _MOD
			
			#/**/define _MOD_STATE				XRAY_MODID_TINKERS_CONSTRUCT
			#/**/define _MOD					TINKERS_CONSTRUCT
			#if _MOD_STATE != INHERIT
				case _MOD:
					#if _MOD_STATE == INCLUDE
						included = true;
					#elif _MOD_STATE == EXCLUDE
						included = false;
					#elif _MOD_STATE == PARTIAL
						switch (blockID) {
							#/**/define _BLOCK_STATE	XRAY_SELECT_TINKERS_CONSTRUCT_COBALT_ORE
							#/**/define _BLOCK			BLOCK_TINKERS_CONSTRUCT_COBALT_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_TINKERS_CONSTRUCT_ARDITE_ORE
							#/**/define _BLOCK			BLOCK_TINKERS_CONSTRUCT_ARDITE_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_TINKERS_CONSTRUCT_COPPER_ORE
							#/**/define _BLOCK			BLOCK_TINKERS_CONSTRUCT_COPPER_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_TINKERS_CONSTRUCT_TIN_ORE
							#/**/define _BLOCK			BLOCK_TINKERS_CONSTRUCT_TIN_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_TINKERS_CONSTRUCT_ALUMINUM_ORE
							#/**/define _BLOCK			BLOCK_TINKERS_CONSTRUCT_ALUMINUM_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
						}
					#endif
				break;
			#endif
			#undef _MOD_STATE
			#undef _MOD
			
			#/**/define _MOD_STATE				XRAY_MODID_RAILCRAFT
			#/**/define _MOD					RAILCRAFT
			#if _MOD_STATE != INHERIT
				case _MOD:
					#if _MOD_STATE == INCLUDE
						included = true;
					#elif _MOD_STATE == EXCLUDE
						included = false;
					#elif _MOD_STATE == PARTIAL
						switch (blockID) {
							#/**/define _BLOCK_STATE	XRAY_SELECT_RAILCRAFT_SULFUR_ORE
							#/**/define _BLOCK			BLOCK_RAILCRAFT_SULFUR_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_RAILCRAFT_SALTPETER_ORE
							#/**/define _BLOCK			BLOCK_RAILCRAFT_SALTPETER_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_RAILCRAFT_DARK_DIAMOND_ORE
							#/**/define _BLOCK			BLOCK_RAILCRAFT_DARK_DIAMOND_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_RAILCRAFT_DARK_EMERALD_ORE
							#/**/define _BLOCK			BLOCK_RAILCRAFT_DARK_EMERALD_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_RAILCRAFT_DARK_LAPIS_LAZULI_ORE
							#/**/define _BLOCK			BLOCK_RAILCRAFT_DARK_LAPIS_LAZULI_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_RAILCRAFT_FIRESTONE_ORE
							#/**/define _BLOCK			BLOCK_RAILCRAFT_FIRESTONE_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_RAILCRAFT_POOR_IRON_ORE
							#/**/define _BLOCK			BLOCK_RAILCRAFT_POOR_IRON_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_RAILCRAFT_POOR_GOLD_ORE
							#/**/define _BLOCK			BLOCK_RAILCRAFT_POOR_GOLD_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_RAILCRAFT_POOR_COPPER_ORE
							#/**/define _BLOCK			BLOCK_RAILCRAFT_POOR_COPPER_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_RAILCRAFT_POOR_TIN_ORE
							#/**/define _BLOCK			BLOCK_RAILCRAFT_POOR_TIN_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
							
							#/**/define _BLOCK_STATE	XRAY_SELECT_RAILCRAFT_POOR_LEAD_ORE
							#/**/define _BLOCK			BLOCK_RAILCRAFT_POOR_LEAD_ORE
							#if _BLOCK_STATE != INHERIT
								case _BLOCK:
									included = _BLOCK_STATE == INCLUDE;
								break;
							#endif
							#undef _BLOCK_STATE
							#undef _BLOCK
						}
					#endif
				break;
			#endif
			#undef _MOD_STATE
			#undef _MOD
		}
	#endif
	
    return included;
}