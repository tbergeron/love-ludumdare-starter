-- Globals Table
-- Contains all re-usable variables and functions
globals = {}

-- Game Version
globals.version = '0.0.0'

-- Assets relative path
globals.assetsDirectory = 'assets/'

-- Date Format
globals.formatDate = function(days_to_format, full)
    local years, months, weeks, days = nil

    -- years
    years = math.floor(days_to_format / 365) > 0 and math.floor(days_to_format / 365) or nil

    if years then
        days_to_format = math.floor(days_to_format - math.floor(years * 365))
    end
    
    -- months
    months = math.floor(days_to_format / 30) > 0 and math.floor(days_to_format / 30) or nil
    if months then
        days_to_format = math.floor(days_to_format - math.floor(months * 30))
    end

    -- weeks
    weeks = math.floor(days_to_format / 7) > 0 and math.floor(days_to_format / 7) or nil
    if weeks then
        days_to_format = math.floor(days_to_format - math.floor(weeks * 7))
    end

    days = days_to_format

    local response = ''

    if years then
        if full then
            local s = stringlobals.len(years) > 0 and 's ' or ' '
            response = years .. 'year' .. s
        else
            response = years .. 'y '
        end
    end

    if months then
        if full then
            local s = stringlobals.len(months) > 0 and 's ' or ' '
            response = response .. months .. ' month' .. s
        else
            response = response .. months .. 'm '
        end
    end  -- todo: AND

    if weeks then
        if full then
            local s = stringlobals.len(weeks) > 0 and 's ' or ' '
            response = response .. weeks .. ' week' .. s
        else
            response = response .. weeks .. 'w '
        end
    end

    if days then
        if full then
            local s = stringlobals.len(days) > 0 and 's ' or ' '
            response = response .. days .. ' day' .. s
        else
            response = response .. days .. 'd'
        end
    end

    return response
end

-- Paths
globals.getPath = function(filename)
    local base_path = globals.assetsDirectory

    base_path = base_path .. filename

    return base_path
end