#ifndef INCLUDE_BUNDLE_ESP
#/**/define INCLUDE_BUNDLE_ESP

#include "/enum/entity.glsl"
#include "/enum/setbase.glsl"
#include "/settings/esp.glsl"

#/**/define _CREATE_ENTITY_CASE \
	case _ENTITY: \
		included = (_ENTITY_STATE == INCLUDE); \
		break; \

bool shouldEsp(int entityID) {
	bool included = false;
	
	#if ESP_GROUP_OTHER != INHERIT
		if(entityID > 200)
			return ESP_GROUP_OTHER == INCLUDE;
	#endif // ESP_GROUP_OTHER
	
	#if ESP_BASE_SET == SET_ALL
		included = true;
	#endif // ESP_BASE_SET
	
	switch(entityID) {
		#/**/define _GROUP_STATE	ESP_GROUP_PEACEFUL
		#if _GROUP_STATE != INHERIT
			#if _GROUP_STATE == PARTIAL
				#/**/define _ENTITY_STATE	ESP_SELECT_VILLAGER
				#/**/define _ENTITY			ENTITY_VILLAGER
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_PARROT
				#/**/define _ENTITY			ENTITY_PARROT
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_RABBIT
				#/**/define _ENTITY			ENTITY_RABBIT
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_HORSE
				#/**/define _ENTITY			ENTITY_HORSE
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_OCELOT
				#/**/define _ENTITY			ENTITY_OCELOT
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_SNOWMAN
				#/**/define _ENTITY			ENTITY_SNOWMAN
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_MOOSHROOM
				#/**/define _ENTITY			ENTITY_MOOSHROOM
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_SQUID
				#/**/define _ENTITY			ENTITY_SQUID
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_CHICKEN
				#/**/define _ENTITY			ENTITY_CHICKEN
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_COW
				#/**/define _ENTITY			ENTITY_COW
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_SHEEP
				#/**/define _ENTITY			ENTITY_SHEEP
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_PIG
				#/**/define _ENTITY			ENTITY_PIG
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_BAT
				#/**/define _ENTITY			ENTITY_BAT
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_MULE
				#/**/define _ENTITY			ENTITY_MULE
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_DONKEY
				#/**/define _ENTITY			ENTITY_DONKEY
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ZOMBIE_HORSE
				#/**/define _ENTITY			ENTITY_ZOMBIE_HORSE
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_SKELETON_HORSE
				#/**/define _ENTITY			ENTITY_SKELETON_HORSE
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
			#else
				case ENTITY_SKELETON_HORSE:
				case ENTITY_ZOMBIE_HORSE:
				case ENTITY_DONKEY:
				case ENTITY_MULE:
				case ENTITY_BAT:
				case ENTITY_PIG:
				case ENTITY_SHEEP:
				case ENTITY_COW:
				case ENTITY_CHICKEN:
				case ENTITY_SQUID:
				case ENTITY_MOOSHROOM:
				case ENTITY_SNOWMAN:
				case ENTITY_OCELOT:
				case ENTITY_HORSE:
				case ENTITY_RABBIT:
				case ENTITY_PARROT:
				case ENTITY_VILLAGER:
					included = _GROUP_STATE == INCLUDE;
					break;
			#endif
		#endif
		#undef _GROUP_STATE
		
		#/**/define _GROUP_STATE	ESP_GROUP_NEUTRAL
		#if _GROUP_STATE != INHERIT
			#if _GROUP_STATE == PARTIAL
				#/**/define _ENTITY_STATE	ESP_SELECT_LLAMA
				#/**/define _ENTITY			ENTITY_LLAMA
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_POLAR_BEAR
				#/**/define _ENTITY			ENTITY_POLAR_BEAR
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_VILLAGER_GOLEM
				#/**/define _ENTITY			ENTITY_VILLAGER_GOLEM
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_WOLF
				#/**/define _ENTITY			ENTITY_WOLF
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ENDERMAN
				#/**/define _ENTITY			ENTITY_ENDERMAN
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ZOMBIE_PIGMAN
				#/**/define _ENTITY			ENTITY_ZOMBIE_PIGMAN
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_SPIDER
				#/**/define _ENTITY			ENTITY_SPIDER
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
			#else
				case ENTITY_SPIDER:
				case ENTITY_ZOMBIE_PIGMAN:
				case ENTITY_ENDERMAN:
				case ENTITY_WOLF:
				case ENTITY_VILLAGER_GOLEM:
				case ENTITY_POLAR_BEAR:
				case ENTITY_LLAMA:
					included = _GROUP_STATE == INCLUDE;
					break;
			#endif
		#endif
		#undef _GROUP_STATE
		
		#/**/define _GROUP_STATE	ESP_GROUP_AGRESSIVE
		#if _GROUP_STATE != INHERIT
			#if _GROUP_STATE == PARTIAL
				#/**/define _ENTITY_STATE	ESP_SELECT_SHULKER
				#/**/define _ENTITY			ENTITY_SHULKER
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_GUARDIAN
				#/**/define _ENTITY			ENTITY_GUARDIAN
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_WITCH
				#/**/define _ENTITY			ENTITY_WITCH
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_WITHER
				#/**/define _ENTITY			ENTITY_WITHER
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_MAGMA_CUBE
				#/**/define _ENTITY			ENTITY_MAGMA_CUBE
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_BLAZE
				#/**/define _ENTITY			ENTITY_BLAZE
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_SILVERFISH
				#/**/define _ENTITY			ENTITY_SILVERFISH
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_CAVE_SPIDER
				#/**/define _ENTITY			ENTITY_CAVE_SPIDER
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_GHAST
				#/**/define _ENTITY			ENTITY_GHAST
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ZOMBIE
				#/**/define _ENTITY			ENTITY_ZOMBIE
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_GIANT
				#/**/define _ENTITY			ENTITY_GIANT
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_SKELETON
				#/**/define _ENTITY			ENTITY_SKELETON
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_CREEPER
				#/**/define _ENTITY			ENTITY_CREEPER
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ILLUSION_ILLAGER
				#/**/define _ENTITY			ENTITY_ILLUSION_ILLAGER
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_VINDICATION_ILLAGER
				#/**/define _ENTITY			ENTITY_VINDICATION_ILLAGER
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_VEX
				#/**/define _ENTITY			ENTITY_VEX
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_EVOCATION_ILLAGER
				#/**/define _ENTITY			ENTITY_EVOCATION_ILLAGER
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ZOMBIE_VILLAGER
				#/**/define _ENTITY			ENTITY_ZOMBIE_VILLAGER
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_HUSK
				#/**/define _ENTITY			ENTITY_HUSK
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_STRAY
				#/**/define _ENTITY			ENTITY_STRAY
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_WITHER_SKELETON
				#/**/define _ENTITY			ENTITY_WITHER_SKELETON
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ELDER_GUARDIAN
				#/**/define _ENTITY			ENTITY_ELDER_GUARDIAN
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ENDER_DRAGON
				#/**/define _ENTITY			ENTITY_ENDER_DRAGON
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ENDERMITE
				#/**/define _ENTITY			ENTITY_ENDERMITE
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_SLIME
				#/**/define _ENTITY			ENTITY_SLIME
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
			#else
				case ENTITY_ELDER_GUARDIAN:
				case ENTITY_WITHER_SKELETON:
				case ENTITY_STRAY:
				case ENTITY_HUSK:
				case ENTITY_ZOMBIE_VILLAGER:
				case ENTITY_EVOCATION_ILLAGER:
				case ENTITY_VEX:
				case ENTITY_VINDICATION_ILLAGER:
				case ENTITY_ILLUSION_ILLAGER:
				case ENTITY_CREEPER:
				case ENTITY_SKELETON:
				case ENTITY_GIANT:
				case ENTITY_ZOMBIE:
				case ENTITY_SLIME:
				case ENTITY_GHAST:
				case ENTITY_CAVE_SPIDER:
				case ENTITY_SILVERFISH:
				case ENTITY_BLAZE:
				case ENTITY_MAGMA_CUBE:
				case ENTITY_ENDER_DRAGON:
				case ENTITY_WITHER:
				case ENTITY_WITCH:
				case ENTITY_GUARDIAN:
				case ENTITY_SHULKER:
				case ENTITY_ENDERMITE:
					included = _GROUP_STATE == INCLUDE;
					break;
			#endif
		#endif
		#undef _GROUP_STATE
		
		#/**/define _GROUP_STATE	ESP_GROUP_VEHICLES
		#if _GROUP_STATE != INHERIT
			#if _GROUP_STATE == PARTIAL
				#/**/define _ENTITY_STATE	ESP_SELECT_SPAWNER_MINECART
				#/**/define _ENTITY			ENTITY_SPAWNER_MINECART
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_HOPPER_MINECART
				#/**/define _ENTITY			ENTITY_HOPPER_MINECART
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_TNT_MINECART
				#/**/define _ENTITY			ENTITY_TNT_MINECART
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_FURNACE_MINECART
				#/**/define _ENTITY			ENTITY_FURNACE_MINECART
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_CHEST_MINECART
				#/**/define _ENTITY			ENTITY_CHEST_MINECART
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_MINECART
				#/**/define _ENTITY			ENTITY_MINECART
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_BOAT
				#/**/define _ENTITY			ENTITY_BOAT
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_COMMANDBLOCK_MINECART
				#/**/define _ENTITY			ENTITY_COMMANDBLOCK_MINECART
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
			#else
				case ENTITY_COMMANDBLOCK_MINECART:
				case ENTITY_BOAT:
				case ENTITY_MINECART:
				case ENTITY_CHEST_MINECART:
				case ENTITY_FURNACE_MINECART:
				case ENTITY_TNT_MINECART:
				case ENTITY_HOPPER_MINECART:
				case ENTITY_SPAWNER_MINECART:
					included = _GROUP_STATE == INCLUDE;
					break;
			#endif
		#endif
		#undef _GROUP_STATE
		
		#/**/define _GROUP_STATE	ESP_GROUP_BLOCKS
		#if _GROUP_STATE != INHERIT
			#if _GROUP_STATE == PARTIAL
				#/**/define _ENTITY_STATE	ESP_SELECT_FALLING_BLOCK
				#/**/define _ENTITY			ENTITY_FALLING_BLOCK
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_TNT
				#/**/define _ENTITY			ENTITY_TNT
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
			#else
				case ENTITY_TNT:
				case ENTITY_FALLING_BLOCK:
					included = _GROUP_STATE == INCLUDE;
					break;
			#endif
		#endif
		#undef _GROUP_STATE
		
		#/**/define _GROUP_STATE	ESP_GROUP_PROJECTILES
		#if _GROUP_STATE != INHERIT
			#if _GROUP_STATE == PARTIAL
				#/**/define _ENTITY_STATE	ESP_SELECT_LLAMA_SPIT
				#/**/define _ENTITY			ENTITY_LLAMA_SPIT
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_DRAGON_FIREBALL
				#/**/define _ENTITY			ENTITY_DRAGON_FIREBALL
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_SHULKER_BULLET
				#/**/define _ENTITY			ENTITY_SHULKER_BULLET
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_SPECTRAL_ARROW
				#/**/define _ENTITY			ENTITY_SPECTRAL_ARROW
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_FIREWORKS_ROCKET
				#/**/define _ENTITY			ENTITY_FIREWORKS_ROCKET
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_WITHER_SKULL
				#/**/define _ENTITY			ENTITY_WITHER_SKULL
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_XP_BOTTLE
				#/**/define _ENTITY			ENTITY_XP_BOTTLE
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_POTION
				#/**/define _ENTITY			ENTITY_POTION
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_EYE_OF_ENDER_SIGNAL
				#/**/define _ENTITY			ENTITY_EYE_OF_ENDER_SIGNAL
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ENDER_PEARL
				#/**/define _ENTITY			ENTITY_ENDER_PEARL
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_SMALL_FIREBALL
				#/**/define _ENTITY			ENTITY_SMALL_FIREBALL
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_FIREBALL
				#/**/define _ENTITY			ENTITY_FIREBALL
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_SNOWBALL
				#/**/define _ENTITY			ENTITY_SNOWBALL
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ARROW
				#/**/define _ENTITY			ENTITY_ARROW
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_EGG
				#/**/define _ENTITY			ENTITY_EGG
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
			#else
				case ENTITY_EGG:
				case ENTITY_ARROW:
				case ENTITY_SNOWBALL:
				case ENTITY_FIREBALL:
				case ENTITY_SMALL_FIREBALL:
				case ENTITY_ENDER_PEARL:
				case ENTITY_EYE_OF_ENDER_SIGNAL:
				case ENTITY_POTION:
				case ENTITY_XP_BOTTLE:
				case ENTITY_WITHER_SKULL:
				case ENTITY_FIREWORKS_ROCKET:
				case ENTITY_SPECTRAL_ARROW:
				case ENTITY_SHULKER_BULLET:
				case ENTITY_DRAGON_FIREBALL:
				case ENTITY_LLAMA_SPIT:
					included = _GROUP_STATE == INCLUDE;
					break;
			#endif
		#endif
		#undef _GROUP_STATE
		
		#/**/define _GROUP_STATE	ESP_GROUP_IMMOBILE
		#if _GROUP_STATE != INHERIT
			#if _GROUP_STATE == PARTIAL
				#/**/define _ENTITY_STATE	ESP_SELECT_ENDER_CRYSTAL
				#/**/define _ENTITY			ENTITY_ENDER_CRYSTAL
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_EVOCATION_FANGS
				#/**/define _ENTITY			ENTITY_EVOCATION_FANGS
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ARMOR_STAND
				#/**/define _ENTITY			ENTITY_ARMOR_STAND
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ITEM_FRAME
				#/**/define _ENTITY			ENTITY_ITEM_FRAME
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_PAINTING
				#/**/define _ENTITY			ENTITY_PAINTING
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_LEASH_KNOT
				#/**/define _ENTITY			ENTITY_LEASH_KNOT
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_AREA_EFFECT_CLOUD
				#/**/define _ENTITY			ENTITY_AREA_EFFECT_CLOUD
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
			#else
				case ENTITY_AREA_EFFECT_CLOUD:
				case ENTITY_LEASH_KNOT:
				case ENTITY_PAINTING:
				case ENTITY_ITEM_FRAME:
				case ENTITY_ARMOR_STAND:
				case ENTITY_EVOCATION_FANGS:
				case ENTITY_ENDER_CRYSTAL:
					included = _GROUP_STATE == INCLUDE;
					break;
			#endif
		#endif
		#undef _GROUP_STATE
		
		#/**/define _GROUP_STATE	ESP_GROUP_DROPS
		#if _GROUP_STATE != INHERIT
			#if _GROUP_STATE == PARTIAL
				#/**/define _ENTITY_STATE	ESP_SELECT_XP_ORB
				#/**/define _ENTITY			ENTITY_XP_ORB
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
				
				#/**/define _ENTITY_STATE	ESP_SELECT_ITEM
				#/**/define _ENTITY			ENTITY_ITEM
				#if _ENTITY_STATE != INHERIT
					_CREATE_ENTITY_CASE
				#endif
				#undef _ENTITY_STATE
				#undef _ENTITY
			#else
				case ENTITY_ITEM:
				case ENTITY_XP_ORB:
					included = _GROUP_STATE == INCLUDE;
					break;
			#endif
		#endif
		#undef _GROUP_STATE
		
		#/**/define _GROUP_STATE	ESP_GROUP_PLAYERS
		#if _GROUP_STATE != INHERIT
			case ENTITY_PLAYER:
				included = _GROUP_STATE == INCLUDE;
				break;
		#endif
		#undef _GROUP_STATE
	}
	
	return included;
}

#undef _CREATE_ENTITY_CASE

#endif