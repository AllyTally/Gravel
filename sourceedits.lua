sourceedits =
{
	["drawmaineditor"] =
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
	["main2"] =
	{
		{
			find = [[
	for t = 1, 17 do
		toolimg[t] = love.graphics.newImage("tools/" .. t .. ".png")
		toolimgicon[t] = love.image.newImageData("tools2/on/" .. t .. ".png")
	end
]],
		    replace = [[
	for t = 1, 17 do
		toolimg[t] = love.graphics.newImage("tools/" .. t .. ".png")
        toolimgicon[t] = love.image.newImageData("tools2/on/" .. t .. ".png")
	end
	toolimg[18] = love.graphics.newImage(gravel_path .. "18.png")
	toolimgicon[18] = love.image.newImageData(gravel_path .. "18i.png")
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
toolshortcuts = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, "R", "T", "Y", "U", "I", "O", "P", "G"}
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
function lefttoolscrollbounds()
	if (lefttoolscroll < -368) then
		lefttoolscroll = -368
]],
		    replace = [[
function lefttoolscrollbounds()
	if (lefttoolscroll < -416) then
		lefttoolscroll = -416
]],
			ignore_error = false,
			luapattern = false,
			allowmultiple = false,
        },
		{
			find = [[
		selectedtool = 1; selectedsubtool = {1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1}
]],
		    replace = [[
 		selectedtool = 1; selectedsubtool = {1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1}
]],
			ignore_error = false,
			luapattern = false,
			allowmultiple = false,
        }
    }
}