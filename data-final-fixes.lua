-- thanks https://github.com/Xevion/research-multipliers

function is_infinite_research(name)
    return data.raw.technology[name].max_level == "infinite";
end

for name, technology in pairs(data.raw.technology) do
    -- skip trigger technology
    if (technology.research_trigger ~= nil) then
        goto continue;
    end

    -- debug printing
    -- if is_infinite_research(name) then
    --     log(name .. " INFINITE")
    -- else
    --     log(name .. " default")
    -- end

    -- if infinite, set the cost to what it was before the research multiplier was applied
    if is_infinite_research(name) then
        technology.ignore_tech_cost_multiplier = true
        -- log(name .. " : ignore_tech_cost_multiplier = true")
    end

    ::continue::
end
