#ifndef INCLUDE_BUNDLE_BLOCK
#/**/define INCLUDE_BUNDLE_BLOCK

#include "/enum/block.glsl"
#include "/enum/modid.glsl"
#include "/enum/knownore.glsl"

#define GET_BLOCK_MAGIC_NUMBER(blockID) bitfieldExtract(blockID, 12, 4)
#define GET_MODID(blockID) bitfieldExtract(blockID, 7, 5)
#define GET_KNOWN_ORE(blockID) bitfieldExtract(blockID, 2, 4)
#define IS_ORE(blockID) (GET_BLOCK_MAGIC_NUMBER(blockID) == 4)
#define IS_KNOWN_ORE_FLIPPED(blockID) ((blockID & 64) != 0)
#define IS_KNOWN_ORE(blockID) IS_ORE(blockID) && IS_KNOWN_ORE_FLIPPED(blockID)

#endif