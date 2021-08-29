local Attack = {}
Attack.__index = Attack

function Attack.new(default, shock)
    return setmetatable({
        default = default,
        shock = shock,
    }, Attack)
end

function Attack:default(arg)
    local attack = 10
    arg.life = arg.life - attack
    print(arg.name.." got attacked for "..attack.." damage")
end

function Attack:shock(arg)
    local attack = 40
    arg.life = arg.life - attack
    print(arg.name.." got attacked for "..attack.." damage")
end

return Attack