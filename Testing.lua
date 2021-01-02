local function areTablesEqual(a, b)
    local aKeys = Object.keys(a)
    local bKeys = Object.keys(b)
    if #aKeys ~= #bKeys then
        return false
    end
    local allKeys = Array.concat(aKeys, bKeys)
    for _, key in ipairs(allKeys) do
        if a[key] ~= b[key] then
            return false
        end
    end

    return true
end

local function equals(a, b)
    local typeA = type(a)
    local typeB = type(b)
    if typeA == 'table' and typeB == 'table' then
        return areTablesEqual(a, b)
    elseif typeA == 'boolean' and typeB == 'boolean' then
        return a == b
    else
        -- TODO: Extend as required
        print('Error: equals not implemented for given type.')
        return false
    end
end

local function expect(value)
    return {
        toEqual = function (expectedValue)
            return equals(value, expectedValue)
        end
    }
end

Testing = {
    expect = expect
}
