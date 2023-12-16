-- Function to help the writing of the images paths
function image_path(image_name)
    return string.format('images/%s.png', image_name)
end

-- Function to check if number is in the specified range
function in_range(number, low, high)
    return (number >= low) and (number <= high)
end

function wait(seconds)
    local start = os.time()
    repeat until os.time() > start + seconds
end


-- -- Transform the board's square position in a string
-- function square_to_str(x, y)
--     assert(in_range(x, 1, 8))
--     assert(in_range(y, 1, 8))
    
--     return string.char(
--       string.byte('a') + x - 1,
--       string.byte('1') + y - 1
--     )
--   end
  
--   -- Transform the screen input in a board square
--   function screen_xy_to_square_xy(x, y)
--     return math.floor((x - 10) / 40) + 1, 11 - math.floor(y / 40)
--   end