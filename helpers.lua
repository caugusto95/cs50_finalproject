-- Function to help the writing of the images paths
function image_path(image_name)
    return string.format('images/%s.png', image_name)
end

-- Function to check if number is in the specified range
function in_range(number, low, high)
    return (number >= low) and (number <= high)
end

-- Function to attribute with pieces survives a battle
function battle_success(atk, def)
    if atk == "T" or def =="T" then
        return "gameover"
    end
    if atk == "A" then
        if def == "K" or def == "Q" or def == "J" then
            return true
        elseif def == "A" then
            return "draw"
        else
            return false
        end
    end
    if atk == "K" or atk == "Q" or atk == "J" then
        if def == "A" then
            return false
        else
            return true
        end
    end
    local number_atk = tonumber(atk)
    local number_def = tonumber(def)
    if number_atk ~= nil then
        if def == "K" or def == "Q" or def == "J" then
            return false
        elseif def == "A" or number_atk > number_def then
            return true
        elseif number_atk == number_def then
            return "draw"
        else
            return false
        end
    end
end
-- Recursive check availability

-- function check_sp_sq(piece_sq, check_sq, board, way)
--     if board.status.occupied then
--         return false
--     end

--     if piece_sq == check_sq then
--         return true
--     end

--     if way == "w" then
--         new_check = string.char(string.byte(string.sub(check_sq, 1, 1)) + 1) .. string.sub(check_sq, 2, 2) 
--         return check_sp_sq(piece_sq, new_check, board, way)
--     elseif way == "e" then
--         new_check = string.char(string.byte(string.sub(check_sq, 1, 1)) - 1) .. string.sub(check_sq, 2, 2)
--         return check_sp_sq(piece_sq, new_check, board, way)
--     elseif way == "s" then
--         new_check = string.sub(check_sq, 1, 1) .. string.char(string.byte(string.sub(check_sq, 2, 2)) + 1) 
--         return check_sp_sq(piece_sq, new_check, board, way)
--     elseif way == "n" then
--         new_check = string.sub(check_sq, 1, 1) .. string.char(string.byte(string.sub(check_sq, 2, 2)) - 1)
--         return check_sp_sq(piece_sq, new_check, board, way)
--     elseif way == "ne" then
--         new_check = string.char(string.byte(string.sub(check_sq, 1, 1)) - 1) .. string.char(string.byte(string.sub(check_sq, 2, 2)) - 1)
--         return check_sp_sq(piece_sq, new_check, board, way)
--     elseif way == "nw" then
--         new_check = string.char(string.byte(string.sub(check_sq, 1, 1)) + 1) .. string.char(string.byte(string.sub(check_sq, 2, 2)) - 1)
--         return check_sp_sq(piece_sq, new_check, board, way)
--     elseif way == "se" then
--         new_check = string.char(string.byte(string.sub(check_sq, 1, 1)) - 1) .. string.char(string.byte(string.sub(check_sq, 2, 2)) + 1)
--         return check_sp_sq(piece_sq, new_check, board, way)
--     elseif way == "sw" then
--         new_check = string.char(string.byte(string.sub(check_sq, 1, 1)) + 1) .. string.char(string.byte(string.sub(check_sq, 2, 2)) + 1)
--         return check_sp_sq(piece_sq, new_check, board, way)
--     end
-- end