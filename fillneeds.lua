-- Use with a unit selected to make them focused and unstressed.
--[====[

fillneeds
=========
Use with a unit selected to make them focused and unstressed.

Alternatively, a unit can be specified by passing ``-unit UNIT_ID``

]====]
local utils = require('utils')
local args = utils.processArgs({...})

function satisfyNeeds(unit)
    local mind = unit.status.current_soul.personality.needs
    for k,v in ipairs(mind) do
        mind[k].focus_level = 400
    end
    unit.status.current_soul.personality.stress_level = -1000000
end

if args.all then
    for _, unit in ipairs(df.global.world.units.all) do
        satisfyNeeds(unit)
    end
else
    local unit = args.unit and df.unit.find(args.unit) or dfhack.gui.getSelectedUnit(true)
    if not unit then
        qerror('A unit must be specified or selected.')
    end
    satisfyNeeds(unit)
end
