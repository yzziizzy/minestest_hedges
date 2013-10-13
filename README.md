minestest_hedges
================

Growing hedges for minetest.


Headges use textures/nodes from various other mods, notably moretrees. All leaf types are supported. Crafting recipes for hedge saplings:

[leavesTop], [leavesTop], [leavesTop]

[leavesMid], [leavesMid], [leavesMid]

sapling, sapling, sapling


Yields 3 hedge saplings


The leaves must currently all be of the same type horizontally.


Tall hedges grow 4 blocks high, shot hedges grow 2 blocks high. Omit the top row of leaves to craft a short hedge.


Two hedges placed next to each other will spread sideways in both directions on top of dirt, sand, and desert sand. 
Use other node types to prevent continued growth. Hedges will spread up and down by one node. Hedges do not spread
diagonally; this would cause problems at corners. Drop a line if you have ideas on how to properly do diagonal hedges
or have ideas about better spreading algorithms.

Hedges are trimmable with technic:chainsaw. The hedge leaf nodes drop their moretrees equivalent leaves, and 
extremely rarely a new hedge sapling. Hedge leaves do not ever drop a sapling for the tree they correspond to. (Sorry coconut palm farmers... go back to your deployer/nodebreaker setup)


Supported leaf nodes:
* Default leaves
* All moretrees leaves
* pine needles from snow_biomes
* banana leaves from farming_plus


Possible Future Extensions
==========================

Once the things above are actually implemented...

* Tea plantations
* Proper orange groves/trees. I grew up in Florida and know very well what a commercial orange grove looks like.


