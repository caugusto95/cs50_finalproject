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

local clock = os.clock
function sleep(n)  -- seconds
   local t0 = clock()
   while clock() - t0 <= n do
   end
end
