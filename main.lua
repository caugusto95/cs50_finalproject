-- RADUKA GAME
-- Import helpers functions
require('helpers')
-- Array of sprites of the game
local images = {}

-- Create Orientation Text
local text = 'R - Set up your pieces'

-- Game over variable
local gameover = false

-- Array of pieces
local pieces = {
    {id = 'B2', position = {x = 0 * 40 + 20, y = 0 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'B2', position = {x = 1 * 40 + 20, y = 0 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'B3', position = {x = 2 * 40 + 20, y = 0 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'B3', position = {x = 3 * 40 + 20, y = 0 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'B4', position = {x = 4 * 40 + 20, y = 0 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'B4', position = {x = 5 * 40 + 20, y = 0 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'B5', position = {x = 6 * 40 + 20, y = 0 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'B5', position = {x = 7 * 40 + 20, y = 0 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'B6', position = {x = 0 * 40 + 20, y = 1 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'B6', position = {x = 1 * 40 + 20, y = 1 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'B7', position = {x = 2 * 40 + 20, y = 1 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'B7', position = {x = 3 * 40 + 20, y = 1 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'BJ', position = {x = 4 * 40 + 20, y = 1 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'BJ', position = {x = 5 * 40 + 20, y = 1 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'BK', position = {x = 6 * 40 + 20, y = 1 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'BK', position = {x = 7 * 40 + 20, y = 1 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'BQ', position = {x = 2 * 40 + 10, y = 2 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'BQ', position = {x = 3 * 40 + 10, y = 2 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'BA', position = {x = 4 * 40 + 10, y = 2 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'BA', position = {x = 5 * 40 + 10, y = 2 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'BT', position = {x = 6 * 40 + 10, y = 2 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'R2', position = {x = 0 * 40 + 20, y = 11 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'R2', position = {x = 1 * 40 + 20, y = 11 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'R3', position = {x = 2 * 40 + 20, y = 11 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'R3', position = {x = 3 * 40 + 20, y = 11 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'R4', position = {x = 4 * 40 + 20, y = 11 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'R4', position = {x = 5 * 40 + 20, y = 11 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'R5', position = {x = 6 * 40 + 20, y = 11 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'R5', position = {x = 7 * 40 + 20, y = 11 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'R6', position = {x = 0 * 40 + 20, y = 12 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'R6', position = {x = 1 * 40 + 20, y = 12 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'R7', position = {x = 2 * 40 + 20, y = 12 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'R7', position = {x = 3 * 40 + 20, y = 12 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'RJ', position = {x = 4 * 40 + 20, y = 12 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'RJ', position = {x = 5 * 40 + 20, y = 12 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'RK', position = {x = 6 * 40 + 20, y = 12 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'RK', position = {x = 7 * 40 + 10, y = 12 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'RQ', position = {x = 2 * 40 + 10, y = 13 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'RQ', position = {x = 3 * 40 + 10, y = 13 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'RA', position = {x = 4 * 40 + 10, y = 13 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'RA', position = {x = 5 * 40 + 10, y = 13 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}},
    {id = 'RT', position = {x = 6 * 40 + 10, y = 13 * 40, square = ""}, dragging = {active = false, dist_x = 0, dist_y = 0}, status = {alive = false, hidden = false}}    
}

-- Board Coordinates
local rows = '87654321'
local columns = 'abcdefgh'
local cont_rows = 1
local cont_columns = 1
local board_coordinates = {}
local square_id = ''

while cont_rows <= 8 do
    while cont_columns <= 8 do
        square_id = string.sub(columns, cont_columns, cont_columns) .. string.sub(rows, cont_rows, cont_rows)
        table.insert(board_coordinates, {id = square_id, position = {x = (cont_columns - 1) * 40 + 20, y = (cont_rows + 2) * 40}, status = {occupied = false, piece_id = '', available_move = false}})
        cont_columns = cont_columns + 1
    end
    cont_columns = 1
    cont_rows = cont_rows + 1
end

--Variable to define the phase of the game
phase = 0

-- Functions to move pieces

local selecting = false

function love.mousepressed(x, y, button, istouch)
    if button == 1 then
       for k, piece in ipairs(pieces) do
            if in_range(x, piece.position.x, piece.position.x + 40) and in_range(y, piece.position.y, piece.position.y + 40) then
                if string.sub(piece.id, 1, 1) == string.sub(text, 1, 1) then
                    piece.dragging.active = true
                    selecting = true
                    piece.dragging.dist_x = x - piece.position.x
                    piece.dragging.dist_y = y - piece.position.y
                end
            end
        end
    end
end

function love.mousereleased(x, y, button)
    if button == 1 then
        for k, piece in ipairs(pieces) do
            if piece.dragging.active then
                piece.dragging.active = false
                selecting = false
            end
        end
    end
end

function love.load()
    -- Add board image to array of images to be drawn
    images['board'] = love.graphics.newImage(image_path('board'))
    -- Add pieces images to array of images
    local teams = 'RB'
    local pieces_types = '234567JQKAT'
    local cont_teams = 1
    local cont_types = 1
    while cont_teams <= 2 do
        while cont_types <= 11 do
            local name = string.sub(teams, cont_teams, cont_teams) .. string.sub(pieces_types, cont_types, cont_types)
            images[name] = love.graphics.newImage(image_path(name))
            cont_types = cont_types + 1
        end
        cont_types = 1
        cont_teams = cont_teams + 1
    end

end

function love.update()
    if gameover then
        return
    end

    -- Dragging and dropping
    selected_info = {sel_square = "", sel_sq_row = "", sel_sq_col = "", sel_piece_id = ""}

    for k, piece in ipairs(pieces) do
        if piece.dragging.active then
            selected_info.sel_square = piece.position.square
            selected_info.sel_piece_id = piece.id
            selected_info.sel_sq_col = string.sub(selected_info.sel_square, 1, 1)
            selected_info.sel_sq_row = string.sub(selected_info.sel_square, 2, 2)
            piece.position.x = love.mouse.getX() - piece.dragging.dist_x
            piece.position.y = love.mouse.getY() - piece.dragging.dist_y
        end
    end

    -- Showing available moves

    if selecting then
        if phase == 0 then  
            for k, board_square in ipairs(board_coordinates) do
                if string.sub(selected_info.sel_piece_id, 1, 1) == 'R' and tonumber(string.sub(board_square.id, 2, 2)) <= 4 and not board_square.status.occupied then 
                    board_square.status.available_move = true
                elseif string.sub(selected_info.sel_piece_id, 1, 1) == 'B' and tonumber(string.sub(board_square.id, 2, 2)) > 4 and not board_square.status.occupied then
                    board_square.status.available_move = true
                else
                    board_square.status.available_move = false
                end
            end
        end

        if phase == 1 then
            local sel_col = string.byte(selected_info.sel_sq_col)
            local sel_row = string.byte(selected_info.sel_sq_row)

            for k, board_square in ipairs(board_coordinates) do
                local col = string.byte(string.sub(board_square.id, 1, 1))
                local row = string.byte(string.sub(board_square.id, 2, 2))        
                if col >= sel_col - 1 and col <= sel_col + 1 then
                    if row >= sel_row - 1 and row <= sel_row + 1 and not board_square.status.occupied then
                        board_square.status.available_move = true
                    else
                        board_square.status.available_move = false
                    end
                end    
            end
        end
    else
        for k, board_square in ipairs(board_coordinates) do
            board_square.status.available_move = false
        end
    end

    -- Snapping piece into correct position and addressing the correct square
    for k, piece in ipairs(pieces) do
        for j, board_square in ipairs(board_coordinates) do
            if not piece.dragging.active then
                if in_range(piece.position.x, board_square.position.x - 20, board_square.position.x + 19) and in_range(piece.position.y, board_square.position.y - 20, board_square.position.y + 19) then
                    piece.position.square = board_square.id
                    piece.position.x = board_square.position.x
                    piece.position.y = board_square.position.y
                    board_square.status.occupied = true
                    board_square.status.piece_id = selected_info.sel_piece_id
                end
            end
        end
    end
        
    -- Checking if the set up phase finished
    if phase == 0 then
        B_setup_finished = true
        R_setup_finished = true
        
        for k, piece in ipairs(pieces) do
            if string.sub(piece.id, 1, 1) == 'R' then
                if piece.position.square == '' then
                    R_setup_finished = false
                end
            end
            if string.sub(piece.id, 1, 1) == 'B' then
                if piece.position.square == '' then
                    B_setup_finished = false
                end
            end
        end
        if R_setup_finished then
            for k, piece in ipairs(pieces) do
                if string.sub(piece.id, 1, 1) == 'R' then
                    piece.status.alive = true
                    piece.status.hidden = true
                end
                text = 'B - Set up your pieces'
            end
        end
        if B_setup_finished then
            for k, piece in ipairs(pieces) do
                if string.sub(piece.id, 1, 1) == 'B' then
                    piece.status.alive = true
                    piece.status.hidden = true
                end                
                text = 'R - Make a move'
                phase = 1
            end
        end 
    end 

    -- Alternating the turns



end

function love.draw()
    -- Drawing the game board
    love.graphics.draw(images['board'], 20, 120)

    -- Drawing the pieces
    for k, piece in ipairs(pieces) do
        if piece.status.hidden then
            love.graphics.draw(love.graphics.newImage(image_path(string.sub(piece.id, 1, 1) .. 'H')), piece.position.x, piece.position.y)
        else    
            love.graphics.draw(images[piece.id], piece.position.x, piece.position.y)
        end
    end

    -- Drawing available moves
    for k, sq in ipairs(board_coordinates) do
        if sq.status.available_move then
            love.graphics.draw(love.graphics.newImage(image_path("AV")), sq.position.x, sq.position.y)
        end
    end

        
    -- Drawing the orientation text
    love.graphics.print({{255, 255, 255}, text}, 0, 560, 0, 1, 1, -3, -3)
end