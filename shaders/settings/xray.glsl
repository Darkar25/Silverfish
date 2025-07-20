#ifndef INCLUDE_SETTINGS_XRAY
#/**/define INCLUDE_SETTINGS_XRAY

#include "/enum/state.glsl"
#include "/enum/setbase.glsl"
#include "/enum/includestate.glsl"
#include "/enum/modid.glsl"
#include "/enum/knownore.glsl"

#define XRAY_ENABLED 			STATE_DISABLED 	// Toggle X-Ray [STATE_DISABLED STATE_ENABLED STATE_ADVANCED]
#define XRAY_BASIC_USE_MODID 					// Use preset ore list from the sprecified mod. Compatible with Known Ores mode.
#define XRAY_BASIC_MODID		MINECRAFT 		// Which mod to use [MINECRAFT INDUSTRIAL_CRAFT IMMERSIVE_ENGINEERING MEKANISM DRACONIC_EVOLUTION THERMAL_FOUNDATION BIG_REACTORS APPLIED_ENERGISTICS BIOMES_O_PLENTY FORESTRY TINKERS_CONSTRUCT RAILCRAFT]
//#define XRAY_BASIC_USE_KNOWN_ORE 				// Use preset list of known ores from selected mod or from multiple mods at the same time. Compatible with Mod ID mode.
#define XRAY_BASIC_KNOWN_ORE	IRON 			// Which ore to use [IRON GOLD DIAMOND COAL EMERALD LAPIS REDSTONE QUARTZ COPPER TIN LEAD SILVER ALUMINUM]
//#define XRAY_USE_SET_MISC 					// Show misc blocks. Incompatible with the glow effect!. List of blocks:. minecraft:obsidian. minecraft:crafting_table. minecraft:furnace. minecraft:anvil. minecraft:mob_spawner. minecraft:end_portal_frame
//#define XRAY_USE_SET_LIQUIDS 					// Show liquids. Incompatible with the glow effect!. List of blocks:. minecraft:water. minecraft:lava
//#define XRAY_USE_SET_CUSTOM 					// Show your custom block set. Incompatible with the glow effect!. Defined in the block.properties file
#define XRAY_BASE_SET 			SET_NONE 		// The set of blocks to begin with [SET_NONE SET_ALL]

//GROUPS
#define XRAY_GROUP_IRON		INHERIT // Toggle the "iron" known group [INHERIT INCLUDE EXCLUDE]
#define XRAY_GROUP_GOLD		INHERIT // Toggle the "gold" known group [INHERIT INCLUDE EXCLUDE]
#define XRAY_GROUP_DIAMOND	INHERIT // Toggle the "diamond" known group [INHERIT INCLUDE EXCLUDE]
#define XRAY_GROUP_COAL		INHERIT // Toggle the "coal" known group [INHERIT INCLUDE EXCLUDE]
#define XRAY_GROUP_EMERALD	INHERIT // Toggle the "emerald" known group [INHERIT INCLUDE EXCLUDE]
#define XRAY_GROUP_LAPIS	INHERIT // Toggle the "lapis" known group [INHERIT INCLUDE EXCLUDE]
#define XRAY_GROUP_REDSTONE	INHERIT // Toggle the "redstone" known group [INHERIT INCLUDE EXCLUDE]
#define XRAY_GROUP_QUARTZ	INHERIT // Toggle the "quartz" known group [INHERIT INCLUDE EXCLUDE]
#define XRAY_GROUP_COPPER	INHERIT // Toggle the "copper" known group [INHERIT INCLUDE EXCLUDE]
#define XRAY_GROUP_TIN		INHERIT // Toggle the "tin" known group [INHERIT INCLUDE EXCLUDE]
#define XRAY_GROUP_LEAD		INHERIT // Toggle the "lead" known group [INHERIT INCLUDE EXCLUDE]
#define XRAY_GROUP_SILVER	INHERIT // Toggle the "silver" known group [INHERIT INCLUDE EXCLUDE]
#define XRAY_GROUP_ALUMINUM	INHERIT // Toggle the "aluminum" known group [INHERIT INCLUDE EXCLUDE]

//MODS
#define XRAY_MODID_MINECRAFT				INHERIT // Toggle the ores from the mod "minecraft" [INHERIT INCLUDE EXCLUDE PARTIAL]
#define XRAY_MODID_INDUSTRIAL_CRAFT			INHERIT // Toggle the ores from the mod "IC2" [INHERIT INCLUDE EXCLUDE PARTIAL]
#define XRAY_MODID_IMMERSIVE_ENGINEERING	INHERIT // Toggle the ores from the mod "ImmersiveEngineering" [INHERIT INCLUDE EXCLUDE PARTIAL]
#define XRAY_MODID_MEKANISM					INHERIT // Toggle the ores from the mod "Mekanism" [INHERIT INCLUDE EXCLUDE PARTIAL]
#define XRAY_MODID_DRACONIC_EVOLUTION		INHERIT // Toggle the ores from the mod "DraconicEvolution" [INHERIT INCLUDE EXCLUDE PARTIAL]
#define XRAY_MODID_THERMAL_FOUNDATION		INHERIT // Toggle the ores from the mod "ThermalFoundation" [INHERIT INCLUDE EXCLUDE PARTIAL]
#define XRAY_MODID_BIG_REACTORS				INHERIT // Toggle the ores from the mod "BigReactors" [INHERIT INCLUDE EXCLUDE PARTIAL]
#define XRAY_MODID_APPLIED_ENERGISTICS		INHERIT // Toggle the ores from the mod "appliedenergistics2" [INHERIT INCLUDE EXCLUDE PARTIAL]
#define XRAY_MODID_BIOMES_O_PLENTY			INHERIT // Toggle the ores from the mod "BiomesOPlenty" [INHERIT INCLUDE EXCLUDE PARTIAL]
#define XRAY_MODID_FORESTRY					INHERIT // Toggle the ores from the mod "Forestry" [INHERIT INCLUDE EXCLUDE PARTIAL]
#define XRAY_MODID_TINKERS_CONSTRUCT		INHERIT // Toggle the ores from the mod "TConstruct" [INHERIT INCLUDE EXCLUDE PARTIAL]
#define XRAY_MODID_RAILCRAFT				INHERIT // Toggle the ores from the mod "Railcraft" [INHERIT INCLUDE EXCLUDE PARTIAL]

// SELECTIONS
#define XRAY_SELECT_MINECRAFT_IRON_ORE						INHERIT // Toggle the "iron" ore from the mod "minecraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_MINECRAFT_GOLD_ORE						INHERIT // Toggle the "gold" ore from the mod "minecraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_MINECRAFT_DIAMOND_ORE					INHERIT // Toggle the "diamond" ore from the mod "minecraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_MINECRAFT_COAL_ORE						INHERIT // Toggle the "coal" ore from the mod "minecraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_MINECRAFT_EMERALD_ORE					INHERIT // Toggle the "emerald" ore from the mod "minecraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_MINECRAFT_LAPIS_ORE						INHERIT // Toggle the "lapis" ore from the mod "minecraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_MINECRAFT_REDSTONE_ORE					INHERIT // Toggle the "redstone" ore from the mod "minecraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_MINECRAFT_QUARTZ_ORE					INHERIT // Toggle the "quartz" ore from the mod "minecraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_MINECRAFT_COPPER_ORE					INHERIT // Toggle the "copper" ore from the mod "minecraft". Incompatible with minecraft <1.17! [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_INDUSTRIAL_CRAFT_COPPER_ORE				INHERIT // Toggle the "copper" ore from the mod "IC2" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_INDUSTRIAL_CRAFT_TIN_ORE				INHERIT // Toggle the "tin" ore from the mod "IC2" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_INDUSTRIAL_CRAFT_URAN_ORE				INHERIT // Toggle the "uran" ore from the mod "IC2" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_INDUSTRIAL_CRAFT_LEAD_ORE				INHERIT // Toggle the "lead" ore from the mod "IC2" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_IMMERSIVE_ENGINEERING_COPPER_ORE		INHERIT // Toggle the "copper" ore from the mod "ImmersiveEngineering" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_IMMERSIVE_ENGINEERING_BAUXITE_ORE		INHERIT // Toggle the "bauxite" ore from the mod "ImmersiveEngineering" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_IMMERSIVE_ENGINEERING_LEAD_ORE			INHERIT // Toggle the "lead" ore from the mod "ImmersiveEngineering" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_IMMERSIVE_ENGINEERING_SILVER_ORE		INHERIT // Toggle the "silver" ore from the mod "ImmersiveEngineering" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_IMMERSIVE_ENGINEERING_NICKEL_ORE		INHERIT // Toggle the "nickel" ore from the mod "ImmersiveEngineering" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_MEKANISM_OSMIUM_ORE						INHERIT // Toggle the "osmium" ore from the mod "Mekanism" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_MEKANISM_COPPER_ORE						INHERIT // Toggle the "copper" ore from the mod "Mekanism" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_MEKANISM_TIN_ORE						INHERIT // Toggle the "tin" ore from the mod "Mekanism" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_DRACONIC_EVOLUTION_DRACONIUM_ORE		INHERIT // Toggle the "draconium" ore from the mod "DraconicEvolution" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_THERMAL_FOUNDATION_COPPER_ORE			INHERIT // Toggle the "copper" ore from the mod "ThermalFoundation" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_THERMAL_FOUNDATION_TIN_ORE				INHERIT // Toggle the "tin" ore from the mod "ThermalFoundation" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_THERMAL_FOUNDATION_SILVER_ORE			INHERIT // Toggle the "silver" ore from the mod "ThermalFoundation" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_THERMAL_FOUNDATION_LEAD_ORE				INHERIT // Toggle the "lead" ore from the mod "ThermalFoundation" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_THERMAL_FOUNDATION_FERROUS_ORE			INHERIT // Toggle the "ferrous" ore from the mod "ThermalFoundation" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_THERMAL_FOUNDATION_SHINY_ORE			INHERIT // Toggle the "shiny" ore from the mod "ThermalFoundation" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_THERMAL_FOUNDATION_MANA_INFISED_ORE		INHERIT // Toggle the "mana infused" ore from the mod "ThermalFoundation" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_BIG_REACTORS_YELLORITE_ORE				INHERIT // Toggle the "yellorite" ore from the mod "BigReactors" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_APPLIED_ENERGISTICS_QUARTZ_ORE			INHERIT // Toggle the "quartz" ore from the mod "appliedenergistics2" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_APPLIED_ENERGISTICS_CHARGED_QUARTZ_ORE	INHERIT // Toggle the "charged quartz" ore from the mod "appliedenergistics2" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_BIOMES_O_PLENTY_BIOME_BLOCK_ORE			INHERIT // Toggle the "biome block" ore from the mod "BiomesOPlenty" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_BIOMES_O_PLENTY_ENDER_AMETHYST_ORE		INHERIT // Toggle the "ender amethyst" ore from the mod "BiomesOPlenty" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_BIOMES_O_PLENTY_RUBY_ORE				INHERIT // Toggle the "ruby" ore from the mod "BiomesOPlenty" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_BIOMES_O_PLENTY_PERIDOT_ORE				INHERIT // Toggle the "peridot" ore from the mod "BiomesOPlenty" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_BIOMES_O_PLENTY_TOPAZ_ORE				INHERIT // Toggle the "topaz" ore from the mod "BiomesOPlenty" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_BIOMES_O_PLENTY_TANZANITE_ORE			INHERIT // Toggle the "tanzanite" ore from the mod "BiomesOPlenty" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_BIOMES_O_PLENTY_MALACHITE_ORE			INHERIT // Toggle the "malachite" ore from the mod "BiomesOPlenty" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_BIOMES_O_PLENTY_SAPPHIRE_ORE			INHERIT // Toggle the "sapphire" ore from the mod "BiomesOPlenty" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_BIOMES_O_PLENTY_AMBER_ORE				INHERIT // Toggle the "amber" ore from the mod "BiomesOPlenty" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_FORESTRY_APATITE_ORE					INHERIT // Toggle the "apatite" ore from the mod "Forestry" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_FORESTRY_COPPER_ORE						INHERIT // Toggle the "copper" ore from the mod "Forestry" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_FORESTRY_TIN_ORE						INHERIT // Toggle the "tin" ore from the mod "Forestry" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_TINKERS_CONSTRUCT_COBALT_ORE			INHERIT // Toggle the "cobalt" ore from the mod "TConstruct" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_TINKERS_CONSTRUCT_ARDITE_ORE			INHERIT // Toggle the "ardite" ore from the mod "TConstruct" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_TINKERS_CONSTRUCT_COPPER_ORE			INHERIT // Toggle the "copper" ore from the mod "TConstruct" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_TINKERS_CONSTRUCT_TIN_ORE				INHERIT // Toggle the "tin" ore from the mod "TConstruct" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_TINKERS_CONSTRUCT_ALUMINUM_ORE			INHERIT // Toggle the "aluminum" ore from the mod "TConstruct" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_RAILCRAFT_SULFUR_ORE					INHERIT // Toggle the "sulfur" ore from the mod "Railcraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_RAILCRAFT_SALTPETER_ORE					INHERIT // Toggle the "saltpeter" ore from the mod "Railcraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_RAILCRAFT_DARK_DIAMOND_ORE				INHERIT // Toggle the "dark diamond" ore from the mod "Railcraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_RAILCRAFT_DARK_EMERALD_ORE				INHERIT // Toggle the "dark emerald" ore from the mod "Railcraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_RAILCRAFT_DARK_LAPIS_LAZULI_ORE			INHERIT // Toggle the "dark lapis lazuli" ore from the mod "Railcraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_RAILCRAFT_FIRESTONE_ORE					INHERIT // Toggle the "firestone" ore from the mod "Railcraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_RAILCRAFT_POOR_IRON_ORE					INHERIT // Toggle the "poor iron" ore from the mod "Railcraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_RAILCRAFT_POOR_GOLD_ORE					INHERIT // Toggle the "poor gold" ore from the mod "Railcraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_RAILCRAFT_POOR_COPPER_ORE				INHERIT // Toggle the "poor copper" ore from the mod "Railcraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_RAILCRAFT_POOR_TIN_ORE					INHERIT // Toggle the "poor tin" ore from the mod "Railcraft" [INHERIT INCLUDE EXCLUDE]
#define XRAY_SELECT_RAILCRAFT_POOR_LEAD_ORE					INHERIT // Toggle the "poor lead" ore from the mod "Railcraft" [INHERIT INCLUDE EXCLUDE]

#include "/settings/killswitch.glsl"

#ifdef KILLSWITCH
#undef XRAY_ENABLED
#/**/define XRAY_ENABLED STATE_DISABLED
#endif

#endif