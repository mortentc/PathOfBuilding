local Gen = require 'lqc.generator'
local lib = require 'lqc.lqc_gen'

local gen_dmg_type =
    lib.elements({"Fire", "Cold", "Lightning", "Physical", "Chaos"})

local function pick(size)
    local n = lib.choose(0, 10000):pick()
    return {string.format("\z+%d to maximum life", n)}
end

local function shrink(prev)
    if #prev > 1 then
        local gone_idx = int(1, #prev-1)
        table.remove(prev, gone_idx)
    end
    return prev
end

return Gen.new(pick, shrink)