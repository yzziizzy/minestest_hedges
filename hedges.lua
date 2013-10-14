



hedges.register_leaves = function(name, leafnode, leaftex)
	
	minetest.register_node("hedges:"..name.."_leaves", {
		description = name.." Leaves",
		drawtype = "allfaces_optional",
		tiles = { leaftex },
		paramtype = "light",
		groups = {snappy=3, flammable=2, leaves=1, hedges_leaves=1,not_in_creatve_inventory=1},
		sounds = default.node_sound_leaves_defaults(),

		drop = {
			max_items = 1,
			items = {
				{items = {"hedges:"..name.."_sapling"}, rarity = 200 },
				{items = {leafnode} }
			}
		},
	})


end


hedges.register_root = function(name, leaftex, maxheight)
	
	minetest.register_node("hedges:"..name.."_root", {
		description = name.." Root ",
		drawtype = "allfaces_optional",
		tiles = { leaftex.."^hedges_root.png" },
		paramtype = "light",
		groups = {snappy=3, flammable=2, leaves=1, hedges_root=1},
		sounds = default.node_sound_leaves_defaults(),
		
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("hedgename", name)
		end	
		
-- 		drop = {
-- 			max_items = 1,
-- 			items = {
-- 				{items = {"hedges:"..name.."_sapling"}, rarity = 200 },
-- 				{items = {"hedges:"..name.."_root"} }
-- 			}
-- 		},
	})
	

end


hedges.register_sapling = function(name, maxheight)
	
	minetest.register_node("hedges:"..name.."_sapling", {
		description = name.." Sapling "..maxheight,
		drawtype = "allfaces_optional",
		tiles = { "hedges_root.png" },
		paramtype = "light",
		groups = {snappy=3, flammable=2, leaves=1, hedges_sapling=1},
		sounds = default.node_sound_leaves_defaults(),
		on_construct = function(pos)
			local meta = minetest.get_meta(pos)
			meta:set_string("hedgename", name)
		end
-- 		drop = {
-- 			max_items = 1,
-- 			items = {
-- 				{items = {"hedges:"..name.."_sapling"}, rarity = 200 },
-- 				{items = {"hedges:"..name.."_root"} }
-- 			}
-- 		},
	})


end



hedges.register_hedge = function(name, leafnode, leaftex, maxheight)
	
	--register the sapling
	hedges.register_sapling(name, maxheight)
	
	-- register the root
	hedges.register_root(name, leaftex, maxheight)
	
	-- register the leaves
	hedges.register_leaves(name, leafnode, leaftex)
	

end



hedges.register_hedge("defaultleaves", "default:leaves", "default_leaves.png", 4)
hedges.register_hedge("pineneedles", "snow:needles", "snow_needles.png", 4)




minetest.register_abm({
	nodenames = {"group:hedges_sapling"},
	interval = 20,
	chance = 1,
	action = function(pos, node)
		pos.y = pos.y-1
		local name = minetest.get_node(pos).name
		if name == "default:dirt" 
			or name == "default:dirt_with_grass" 
			or name == "default:sand"
			or name == "default:desert_sand"
			
			then
			
			pos.y = pos.y+1
			local meta = minetest.get_meta(pos)
			local nn = meta:get_string("hedgename")
			
			minetest.set_node(pos, {name="hedges:"..nn.."_root"})

		end
	end,
})

hedges.node_in_dir = function(pos, x,z, name)
	
	pos.x = pos.x + x
	pos.z = pos.z + z
	
	local n = minetest.get_node(pos).name
	if n == name then return pos end
	
	pos.y = pos.y + 1
	local n = minetest.get_node(pos).name
	if n == name then return pos end
	
	pos.y = pos.y - 2
	local n = minetest.get_node(pos).name
	if n == name then return pos end
	
	return nil
end

hedges.can_spread = function(pos, x,z, name) 
	local p1 = hedges.node_in_dir(pos, x,z, name)
	if p1 == nil then return false end
	
	local p2 = hedges.node_in_dir(p1, x,z, name)
	if p2 == nil then return false end
	
	pos.x = pos.x - x
	
	return true
end


minetest.register_abm({
	nodenames = {"group:hedges_root"},
	interval = 10,
	chance = 1,
	action = function(pos, node)
		local op = pos
		pos.y = pos.y-1
		local name = minetest.get_node(pos).name
		if name == "default:dirt" 
			or name == "default:dirt_with_grass" 
			or name == "default:sand"
			or name == "default:desert_sand"
			
			then
			
			-- grow up
			pos.y = pos.y+1
			
			local meta = minetest.get_meta(pos)
			local nn = meta:get_string("hedgename")
			pos.y = pos.y+1
			
			print("name: "..nn)
			local height = 1
			while minetest.get_node(pos).name == "hedges:"..nn.."_leaves" and height < 3 do
				height = height+1
				pos.y = pos.y+1
			end
			print(height)
			if height == 3 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="hedges:"..nn.."_leaves"})
				end
			elseif height < 3 then
				if minetest.get_node(pos).name == "air" then
					minetest.set_node(pos, {name="hedges:"..nn.."_leaves"})
				end
			end
			
			-- spread
			if hedges.can_spread(op, 1,0, name) then
				minetest.set_node({x=op.x+1, y=op.y, z=op.z}, {name="hedges:"..nn.."_sapling"})
			elseif hedges.can_spread(op, -1,0, name) then
			
		end
	end
})


-- for i in ipairs(moretrees.treelist) do
-- 	minetest.register_node("moretrees:"..treename.."_leaves", {
-- 		description = treedesc.." Leaves",
-- 		drawtype = "allfaces_optional",
-- 		tiles = { "moretrees_"..treename.."_leaves.png" },
-- 		paramtype = "light",
-- 		groups = {snappy=3, flammable=2, leaves=1, moretrees_leaves=1},
-- 		sounds = default.node_sound_leaves_defaults(),
-- 
-- 		drop = {
-- 			max_items = 1,
-- 			items = {
-- 				{items = {"moretrees:"..treename.."_sapling"}, rarity = 100 },
-- 				{items = {"moretrees:"..treename.."_leaves"} }
-- 			}
-- 		},
-- 	})
-- 	
-- end