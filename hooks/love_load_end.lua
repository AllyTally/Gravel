toolnames[18]       = "Gravel fill"
subtoolnames[18]    = {}
subtoolimgs[18]     = {}
gravel_usex         = 0
gravel_usey         = 0

function string:split(sSeparator, nMax, bRegexp)
    assert(sSeparator ~= '')
    assert(nMax == nil or nMax >= 1)
 
    local aRecord = {}
 
    if self:len() > 0 then
       local bPlain = not bRegexp
       nMax = nMax or -1
 
       local nField, nStart = 1, 1
       local nFirst,nLast = self:find(sSeparator, nStart, bPlain)
       while nFirst and nMax ~= 0 do
          aRecord[nField] = self:sub(nStart, nFirst-1)
          nField = nField+1
          nStart = nLast+1
          nFirst,nLast = self:find(sSeparator, nStart, bPlain)
          nMax = nMax-1
       end
       aRecord[nField] = self:sub(nStart)
    end
 
    return aRecord
end

function handle_fill(button, fields)
	if button == DB.CANCEL then
        return
    end
    inputd = string.split(fields.inputdata,",")
    for a = 1, #inputd do
        if not tonumber(inputd[a]) then
            dialog.create("Something you passed wasn't a number! Please make sure they're all numbers, and no trailing comma.")
            return
        end
    end
    levelmetadata_set(roomx, roomy, "directmode", 1)
    atx = gravel_usex
    aty = gravel_usey
    local previoustiles = table.copy(roomdata_get(roomx, roomy))
    local oldtile = roomdata[roomy][roomx][aty*40+atx+1]
    local tilesarea, i = {{atx, aty}}, 1
    while tilesarea[i] ~= nil and i < 1200 do
        local f_x, f_y = unpack(tilesarea[i])
        for _,dir in pairs({{-1,0}, {0,-1}, {1,0}, {0,1}}) do
            if  f_x+dir[1] >= 0 and f_x+dir[1] <= 39
            and f_y+dir[2] >= 0 and f_y+dir[2] <= 29
            and roomdata[roomy][roomx][(f_y+dir[2])*40+f_x+dir[1]+1] == oldtile then
                roomdata[roomy][roomx][(f_y+dir[2])*40+f_x+dir[1]+1] = tonumber(inputd[math.random(#inputd)])
                table.insert(tilesarea, {f_x+dir[1], f_y+dir[2]})
            end
        end
        i = i + 1
    end
    table.insert(
        undobuffer,
        {
            undotype = "tiles",
            rx = roomx,
            ry = roomy,
            toundotiles = previoustiles,
            toredotiles = table.copy(roomdata_get(roomx, roomy))
        }
    )
    finish_undo("GRAVEL PLUGIN")
end
