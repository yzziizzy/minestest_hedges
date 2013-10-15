minestest_hedges
================

!!! ***this mod is not done. it does not work now. *** !!!

Growing hedges for minetest.


Headges use textures/nodes from various other mods, notably moretrees. All leaf types are supported. Crafting recipes for hedge saplings:

[leavesTop], [leavesTop], [leavesTop]

[leavesMid], [leavesMid], [leavesMid]

sapling, sapling, sapling


Yields 3 hedge saplings


The leaves must currently all be of the same type horizontally.


Tall hedges grow 4 nodes high, short hedges grow 2 blocks high. Omit the top row of leaves to craft a short hedge.


Three hedges placed in a row will spread sideways in both directions on top of dirt, sand, and desert sand. 
Use other node types to prevent continued growth. Hedges will spread up and down by one node. Hedges do not spread
diagonally for now.

Ideally, Hedges would trimmable with technic:chainsaw. However, the list of nodes the chainsaw can cut is defined 
locally to that file. A dedicated hedgetrimmer tool will be added soon. The hedge leaf nodes drop their moretrees 
equivalent leaves, and extremely rarely a new hedge sapling. Hedge leaves do not ever drop a sapling for the tree 
they correspond to. (Sorry coconut palm farmers... go back to your deployer/nodebreaker setup)


Supported leaf nodes:
* Default leaves
* All moretrees leaves
* pine needles from snow_biomes
* banana leaves from farming_plus
* Climbing poison ivy


Possible Future Extensions
==========================

Once the things above are actually implemented...

* Tea plantations
* Proper orange groves/trees. The farming_plus version sucks.


