sourceedits =
{
	["drawmaineditor"] =
	{
		{
			find = [[
		elseif selectedtool == 20 then
			-- Teleporter
			displayshapedcursor(0, 0, 11, 11)
]],
			replace = [[
		elseif selectedtool == 20 then
			-- Teleporter
			displayshapedcursor(0, 0, 11, 11)
		elseif selectedtool == 21 then
			-- Gravel fill
			displayshapedcursor(0, 0, 0, 0)
]],
			ignore_error = false,
			luapattern = false,
			allowmultiple = false,
		},
		{
		find = [[
		for t = 1, 20 do
]],
		replace = [[
		for t = 1, 21 do
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
        elseif love.mouse.isDown("l") and not mousepressed and selectedtool == 21 then
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
	for t = 1, 20 do
		toolimg[t] = love.graphics.newImage("tools/" .. t .. ".png")
		toolimgicon[t] = love.image.newImageData("tools2/on/" .. t .. ".png")
	end
]],
		    replace = [[
	for t = 1, 20 do
		toolimg[t] = love.graphics.newImage("tools/" .. t .. ".png")
        toolimgicon[t] = love.image.newImageData("tools2/on/" .. t .. ".png")
	end
	toolimg[21] = love.graphics.newImage(gravel_path .. "gravel.png")
	toolimgicon[21] = love.image.newImageData(gravel_path .. "graveli.png")
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
toolshortcuts = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, "R", "T", "Y", "U", "I", "O", "P", "s1", "s2", "s3"}
]],
		    replace = [[
toolshortcuts = {1, 2, 3, 4, 5, 6, 7, 8, 9, 0, "R", "T", "Y", "U", "I", "O", "P", "s1", "s2", "s3", "A"}
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
	local max_scroll = 368
	if metadata.target == "VCE" then
		max_scroll = 512
	end
]],
		    replace = [[
function lefttoolscrollbounds()
	local max_scroll = 416
	if metadata.target == "VCE" then
		max_scroll = 560
	end
]],
			ignore_error = false,
			luapattern = false,
			allowmultiple = false,
        },
		{
			find = [[
		selectedtool = 1; selectedsubtool = {1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1, 1,1,1}
]],
		    replace = [[
 		selectedtool = 1; selectedsubtool = {1,1,1,1,1, 1,1,1,1,1, 1,1,1,1,1, 1,1, 1,1,1, 1}
]],
			ignore_error = false,
			luapattern = false,
			allowmultiple = false,
        }
    }
}
