local Heal = {}
Heal.__index = Heal

function Heal.new(default, shock)
    return setmetatable({
        default = default,
        super = shock,
    }, Heal)
end

function Heal:default(arg)
    local heal = 10
    arg.life = arg.life + heal
    print(arg.name.." got healed for "..heal.." life")
end

function Heal:super(arg)
    local heal = 40
    arg.life = arg.life + heal
    print(arg.name.." got healed for "..heal.." life")
end

return Heal