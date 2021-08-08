sourceedits =
{
	["uis/maineditor/draw"] =
	{
		{
			find = [[
		elseif selectedtool == 17 then
			-- Start point
			displayshapedcursor(0, 0, 1, 2)
]],
			replace = [[
		elseif selectedtool == 17 then
			-- Start point
			displayshapedcursor(0, 0, 1, 2)
		elseif selectedtool == 18 then
			-- Gravel fill
			displayshapedcursor(0, 0, 0, 0)
]],
			ignore_error = false,
			luapattern = false,
			allowmultiple = false,
		},
		{
		find = [[
		for t = 1, 17 do
]],
		replace = [[
		for t = 1, 18 do
]],
		ignore_error = false,
		luapattern = false,
		allowmultiple = false,
        },
		{
		find = [[
		elseif love.mouse.isDown("l") and not mousepressed then
]],
		replace = [[
        elseif love.mouse.isDown("l") and not mousepressed and selectedtool == 18 then
            -- Fill bucket
            gravel_usex = atx
            gravel_usey = aty
            dialog.create("Enter tile numbers with each tile separated by a comma. Example: 0,0,0,12,25", {DB.APPLY, DB.CANCEL}, handle_fill, "Gravel fill", {{"inputdata", 0, 3, 40, "", DF.TEXT}})
		elseif love.mouse.isDown("l") and not mousepressed then
]],
		ignore_error = false,
		luapattern = false,
		allowmultiple = false,
		}
    },
	["callback_load"] =
	{
		{
			find = [[
	for t = 1, 17 do
		toolimg[t] = love.graphics.newImage("tools/" .. t .. ".png")
		toolimgicon[t] = love.image.newImageData("tools/prepared/" .. t .. ".png")
	end
]],
		    replace = [[
	for t = 1, 17 do
		toolimg[t] = love.graphics.newImage("tools/" .. t .. ".png")
        toolimgicon[t] = love.image.newImageData("tools/prepared/" .. t .. ".png")
	end
	toolimg[18] = love.graphics.newImage(gravel_path .. "gravel.png")
	toolimgicon[18] = love.image.newImageData(gravel_path .. "graveli.png")
]],
			ignore_error = false,
			luapattern = false,
			allowmultiple = false,
        }
    },
	["const"] =
	{
		{
			find = [[
toolshortcuts = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, "R", "T", "Y", "U", "I", "O", "P"}
]],
		    replace = [[
toolshortcuts = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, "R", "T", "Y", "U", "I", "O", "P", "A"}
]],
						ignore_error = false,
			luapattern = false,
			allowmultiple = false,
        }
    },
	["func"] =
	{
		{ 
			find = [[
local max_scroll = 368
]],
		    replace = [[
local max_scroll = 416
]],
			ignore_error = false,
			luapattern = false,
			allowmultiple = false,
        },
    }
}
