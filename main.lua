-- Battle of Wings GAME
-- Import helpers functions
require('helpers')

-- Main Menu
local function newButton(text, fn)
    return {
        text = text,
        fn = fn,
        now = false,
        last = false
    }
end

local buttons = {}
local font = nil

game_menu = 0
-- Array of sprites of the game
local images = {}

-- Create Orientation Text
local text = 'R - Set up your pieces'

-- Game over variable
local gameover = false

--Variable to define the phase of the game
phase = 0

-- aux_variable to help organizing the cemetery
R_cem_x = 1
R_cem_y = 0
B_cem_x = 1
B_cem_y = 0

-- Variable to minimize checks
changed_click = 0

-- Resize factor
resize = 1.5
-- Array of pieces
local pieces = {
    {id = 'B2', position = {x = 1 * 40, y = 0 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'B2', position = {x = 2 * 40, y = 0 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'B3', position = {x = 3 * 40, y = 0 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'B3', position = {x = 4 * 40, y = 0 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'B4', position = {x = 5 * 40, y = 0 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'B4', position = {x = 6 * 40, y = 0 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'B5', position = {x = 7 * 40, y = 0 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'B5', position = {x = 1 * 40, y = 1 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'B6', position = {x = 2 * 40, y = 1 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'B6', position = {x = 3 * 40, y = 1 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'B7', position = {x = 4 * 40, y = 1 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'B7', position = {x = 5 * 40, y = 1 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'BJ', position = {x = 6 * 40, y = 1 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'BJ', position = {x = 7 * 40, y = 1 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'BK', position = {x = 1 * 40, y = 2 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'BK', position = {x = 2 * 40, y = 2 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'BQ', position = {x = 3 * 40, y = 2 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'BQ', position = {x = 4 * 40, y = 2 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'BA', position = {x = 5 * 40, y = 2 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'BA', position = {x = 6 * 40, y = 2 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'BT', position = {x = 7 * 40, y = 2 * 40 + 10, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'R2', position = {x = 1 * 40, y = 0 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'R2', position = {x = 2 * 40, y = 0 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'R3', position = {x = 3 * 40, y = 0 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'R3', position = {x = 4 * 40, y = 0 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'R4', position = {x = 5 * 40, y = 0 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'R4', position = {x = 6 * 40, y = 0 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'R5', position = {x = 7 * 40, y = 0 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'R5', position = {x = 1 * 40, y = 1 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'R6', position = {x = 2 * 40, y = 1 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'R6', position = {x = 3 * 40, y = 1 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'R7', position = {x = 4 * 40, y = 1 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'R7', position = {x = 5 * 40, y = 1 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'RJ', position = {x = 6 * 40, y = 1 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'RJ', position = {x = 7 * 40, y = 1 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'RK', position = {x = 1 * 40, y = 2 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'RK', position = {x = 2 * 40, y = 2 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'RQ', position = {x = 3 * 40, y = 2 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'RQ', position = {x = 4 * 40, y = 2 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'RA', position = {x = 5 * 40, y = 2 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'RA', position = {x = 6 * 40, y = 2 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}},
    {id = 'RT', position = {x = 7 * 40, y = 2 * 40 + 450, square = ""}, active = false, status = {alive = false, hidden = false, always_show = false}}    
}

-- Board Coordinates
local rows = '7654321'
local columns = 'abcdefg'
local cont_rows = 1
local cont_columns = 1
local board_coordinates = {}
local square_id = ''

while cont_rows <= 7 do
    while cont_columns <= 7 do
        square_id = string.sub(columns, cont_columns, cont_columns) .. string.sub(rows, cont_rows, cont_rows)
        table.insert(board_coordinates, {id = square_id, position = {x = (cont_columns) * 40, y = (cont_rows - 1) * 40 + 150}, status = {occupied = false, piece_id = '', available_move = false, available_eat = false}})
        cont_columns = cont_columns + 1
    end
    cont_columns = 1
    cont_rows = cont_rows + 1
end

-- Functions to move pieces
selected_info = {selecting = false, sel_square = "", sel_sq_row = "", sel_sq_col = "", sel_piece_id = "", sel_piece_always_show = false}
moved = 0

-- V2: No drag and dropping, selecting and chosing between available moves
function love.mousepressed(x, y, button, istouch)
    if button == 1 then
        if selected_info.selecting == false then
            for k, piece in ipairs(pieces) do
                if in_range(x, piece.position.x * resize, (piece.position.x + 39) * resize) and in_range(y, piece.position.y * resize, (piece.position.y + 39) * resize) then
                    if string.sub(piece.id, 1, 1) == string.sub(text, 1, 1) then
                        piece.active = true
                        selected_info.selecting = true
                        selected_info.sel_square = piece.position.square
                        selected_info.sel_piece_id = piece.id
                        selected_info.sel_sq_col = string.sub(selected_info.sel_square, 1, 1)
                        selected_info.sel_sq_row = string.sub(selected_info.sel_square, 2, 2)
                        selected_info.sel_piece_always_show = piece.status.always_show
                    end
                end
            end
        else
            for j, board_square in ipairs(board_coordinates) do 
                if in_range(love.mouse.getX(), board_square.position.x * resize, (board_square.position.x + 39) * resize) and in_range(love.mouse.getY(), board_square.position.y * resize, (board_square.position.y + 39)  * resize) then
                    if board_square.status.available_move then
                        for k, piece in ipairs(pieces) do
                            if piece.active then
                                piece.position.square = board_square.id
                                piece.position.x = board_square.position.x
                                piece.position.y = board_square.position.y
                                if phase == 1 then
                                    moved = moved + 1
                                    for _, piece in ipairs(pieces) do
                                        piece.status.hidden = true
                                    end
                                    changing = true
                                end                          
                            end
                        end                        
                    end
                    if board_square.status.available_eat then
                        for k, piece in ipairs(pieces) do
                            if board_square.id == piece.position.square then
                                piece.status.always_show = true
                                if battle_success(string.sub(selected_info.sel_piece_id, 2, 2), string.sub(piece.id, 2, 2)) == "gameover" then
                                    gameover = true
                                elseif battle_success(string.sub(selected_info.sel_piece_id, 2, 2), string.sub(piece.id, 2, 2)) == "draw" then
                                    piece.status.alive = false
                                    piece.status.hidden = false
                                    piece.position.square = ""
                                    if string.sub(piece.id, 1, 1) == "B" then                                  
                                        piece.position.x = B_cem_x * 40
                                        piece.position.y = B_cem_y * 40 + 10
                                        if B_cem_x < 7 then 
                                            B_cem_x = B_cem_x + 1
                                        else
                                            B_cem_x = 1
                                            B_cem_y = B_cem_y + 1
                                        end 
                                    else
                                        piece.position.x = R_cem_x * 40
                                        piece.position.y = R_cem_y * 40 + 450
                                        if R_cem_x < 7 then 
                                            R_cem_x = R_cem_x + 1
                                        else
                                            R_cem_x = 1
                                            R_cem_y = R_cem_y + 1
                                        end
                                    end
                                    for k2, piece2 in ipairs(pieces) do
                                        if piece2.active then
                                            piece2.status.alive = false
                                            piece2.position.square = ""
                                            piece2.status.always_show = true
                                            if string.sub(piece2.id, 1, 1) == "B" then                                  
                                                piece2.position.x = B_cem_x * 40
                                                piece2.position.y = B_cem_y * 40 + 10
                                                if B_cem_x < 7 then 
                                                    B_cem_x = B_cem_x + 1
                                                else
                                                    B_cem_x = 1
                                                    B_cem_y = B_cem_y + 1
                                                end 
                                            else
                                                piece2.position.x = R_cem_x * 40
                                                piece2.position.y = R_cem_y * 40 + 450
                                                if R_cem_x < 7 then 
                                                    R_cem_x = R_cem_x + 1
                                                else
                                                    R_cem_x = 1
                                                    R_cem_y = R_cem_y + 1
                                                end
                                            end                        
                                        end
                                    end
                                elseif battle_success(string.sub(selected_info.sel_piece_id, 2, 2), string.sub(piece.id, 2, 2)) then
                                    piece.status.alive = false
                                    piece.status.hidden = false
                                    piece.position.square = ""
                                    if string.sub(piece.id, 1, 1) == "B" then                                  
                                        piece.position.x = B_cem_x * 40
                                        piece.position.y = B_cem_y * 40 + 10
                                        if B_cem_x < 7 then 
                                            B_cem_x = B_cem_x + 1
                                        else
                                            B_cem_x = 1
                                            B_cem_y = B_cem_y + 1
                                        end 
                                    else
                                        piece.position.x = R_cem_x * 40
                                        piece.position.y = R_cem_y * 40 + 450
                                        if R_cem_x < 7 then 
                                            R_cem_x = R_cem_x + 1
                                        else
                                            R_cem_x = 1
                                            R_cem_y = R_cem_y + 1
                                        end
                                    end
                                    for k2, piece2 in ipairs(pieces) do
                                        if piece2.active then
                                            piece2.position.square = board_square.id
                                            piece2.position.x = board_square.position.x
                                            piece2.position.y = board_square.position.y
                                            piece2.status.always_show = true                          
                                        end
                                    end
                                    break 
                                elseif not battle_success(string.sub(selected_info.sel_piece_id, 2, 2), string.sub(piece.id, 2, 2)) then
                                    for k2, piece2 in ipairs(pieces) do
                                        if piece2.active then
                                            piece2.status.alive = false
                                            piece2.position.square = ""
                                            piece2.status.always_show = true
                                            if string.sub(piece2.id, 1, 1) == "B" then                                  
                                                piece2.position.x = B_cem_x * 40
                                                piece2.position.y = B_cem_y * 40 + 10
                                                if B_cem_x < 7 then 
                                                    B_cem_x = B_cem_x + 1
                                                else
                                                    B_cem_x = 0
                                                    B_cem_y = B_cem_y + 1
                                                end 
                                            else
                                                piece2.position.x = R_cem_x * 40
                                                piece2.position.y = R_cem_y * 40 + 450
                                                if R_cem_x < 7 then 
                                                    R_cem_x = R_cem_x + 1
                                                else
                                                    R_cem_x = 0
                                                    R_cem_y = R_cem_y + 1
                                                end
                                            end                        
                                        end
                                    end   
                                end
                                break
                            end
                        end
                        if phase == 1 then
                            moved = moved + 1
                            for _, piece in ipairs(pieces) do
                                piece.status.hidden = true
                            end
                            changing = true
                        end                                       
                    end
                end   
            end
            selected_info.selecting = false
            selected_info.sel_square = ""
            selected_info.sel_piece_id = ""
            selected_info.sel_sq_col = ""
            selected_info.sel_sq_row = ""
            for k, piece in ipairs(pieces) do
                piece.active = false
            end     
        end
    end
    changed_click = changed_click + 1

    -- Aux function for debugging
    if button == 2 then
        print("Select_info -> Selecting")
        print(selected_info.selecting)
        print("Select_info -> sel_square")
        print(selected_info.sel_square)
        print("Select_info -> sel_piece_id")
        print(selected_info.sel_piece_id)
        for k, piece in ipairs(pieces) do
            if in_range(x, piece.position.x, piece.position.x + 40) and in_range(y, piece.position.y, piece.position.y + 40) then
                print("pieces -> id")
                print(piece.id)
                print("pieces -> position.square")
                print(piece.position.square)
                print("pieces -> active")
                print(piece.active)
                print("pieces -> status.alive")
                print(piece.status.alive)
                print("pieces -> status.hidden")
                print(piece.status.hidden)
                print("pieces -> status.always_show")
                print(piece.status.always_show)
            end
        end
        for j, board_square in ipairs(board_coordinates) do 
            if in_range(love.mouse.getX(), board_square.position.x, board_square.position.x + 39) and in_range(love.mouse.getY(), board_square.position.y, board_square.position.y + 39) then
                print("board_coordinates -> id")
                print(board_square.id)
                print("board_coordinates -> status.occupied")
                print(board_square.status.occupied)
                print("board_coordinates -> status.piece_id")
                print(board_square.status.piece_id)
                print("board_coordinates -> status.available_move")
                print(board_square.status.available_move)
                print("board_coordinates -> status.available_eat")
                print(board_square.status.available_eat)
            end
        end
        print("_____________________________")
    end
end

-- Function to change turns and escape game 
function love.keypressed(key)
    if key == "space" then
      changing = false
      changed_click = changed_click + 1
    end
    if key == "escape" then
        love.event.quit(0)
    end
end

function love.load()
    -- Buttons for main menu
    font = love.graphics.newFont(24)

    table.insert(buttons, newButton(
        "Start Game",
        function()
            print("Starting game")
            game_menu = 1
        end
    ))
    
    table.insert(buttons, newButton(
        "How to Play",
        function()
            print("Tutorial")
            game_menu = 2
        end
    ))

    table.insert(buttons, newButton(
        "Exit Game",
        function()
            love.event.quit(0)
        end
    ))

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
        if moved % 2 == 0 then
            text = "Congratulations, the Owls have won the game!"
        else
            text = "Congratulations, the Ravens have won the game!"
        end
        return
    end

    -- Checking occupied spaces
    if my_copy0 ~= changed_click then
        for j, board_square in ipairs(board_coordinates) do
            board_square.status.occupied = false
            board_square.status.piece_id = ""
            for k, piece in ipairs(pieces) do
                if piece.position.square == board_square.id then
                    board_square.status.occupied = true
                    board_square.status.piece_id = piece.id
                end
            end
        end
        my_copy0 = changed_click
    end    

    -- Showing available moves
    if my_copy1 ~= changed_click then
        if selected_info.selecting then
            if phase == 0 then  
                for k, board_square in ipairs(board_coordinates) do
                    if string.sub(selected_info.sel_piece_id, 1, 1) == 'R' and tonumber(string.sub(board_square.id, 2, 2)) <= 3 and not board_square.status.occupied then 
                        board_square.status.available_move = true
                    elseif string.sub(selected_info.sel_piece_id, 1, 1) == 'B' and tonumber(string.sub(board_square.id, 2, 2)) >= 5 and not board_square.status.occupied then
                        board_square.status.available_move = true
                    else                         
                        board_square.status.available_move = false
                    end
                end
            end

            if phase == 1 then
                sel_col = string.byte(selected_info.sel_sq_col)
                sel_row = string.byte(selected_info.sel_sq_row)
                for k, board_square in ipairs(board_coordinates) do
                    local col = string.byte(string.sub(board_square.id, 1, 1))
                    local row = string.byte(string.sub(board_square.id, 2, 2))
                    if not selected_info.sel_piece_always_show then        
                        if col >= sel_col - 1 and col <= sel_col + 1 then
                            if row >= sel_row - 1 and row <= sel_row + 1 then
                                if not board_square.status.occupied then
                                    board_square.status.available_move = true
                                else
                                    if (string.sub(board_square.status.piece_id, 1, 1) == "R" and string.sub(selected_info.sel_piece_id, 1, 1) == "B") or (string.sub(board_square.status.piece_id, 1, 1) == "B" and string.sub(selected_info.sel_piece_id, 1, 1) == "R") then
                                        board_square.status.available_eat = true
                                        board_square.status.available_move = false
                                    else
                                        board_square.status.available_move = false
                                    end
                                end
                            end
                        end
                    end
                end
            end
        else
            for k, board_square in ipairs(board_coordinates) do
                board_square.status.available_move = false
                board_square.status.available_eat = false
            end
        end 
        my_copy1 = changed_click
    end  

    -- Special pieces available moves
    if my_copy2 ~= changed_click then
        if phase == 1 then
            if string.sub(selected_info.sel_piece_id, 2, 2) == "J" or string.sub(selected_info.sel_piece_id, 2, 2) == "Q" then
                checking_e = true
                aux_checking = 1
                if selected_info.selecting then
                    while checking_e do
                        square_checked = string.char(string.byte(string.sub(selected_info.sel_square, 1, 1)) + aux_checking) .. string.sub(selected_info.sel_square, 2, 2)
                        for k, board_square in ipairs(board_coordinates) do
                            if square_checked == board_square.id then
                                if not board_square.status.occupied then
                                    board_square.status.available_move = true
                                else
                                    checking_e = false
                                    if (string.sub(board_square.status.piece_id, 1, 1) == "R" and string.sub(selected_info.sel_piece_id, 1, 1) == "B") or (string.sub(board_square.status.piece_id, 1, 1) == "B" and string.sub(selected_info.sel_piece_id, 1, 1) == "R") then
                                        board_square.status.available_eat = true
                                    end
                                    break
                                end
                            end
                        end
                        aux_checking = aux_checking + 1
                        if string.byte(string.sub(selected_info.sel_square, 1, 1)) + aux_checking > string.byte("h") then
                            checking_e = false
                        end
                    end
                end
                checking_w = true
                aux_checking = 1
                if selected_info.selecting then
                    while checking_w do
                        square_checked = string.char(string.byte(string.sub(selected_info.sel_square, 1, 1)) - aux_checking) .. string.sub(selected_info.sel_square, 2, 2)
                        for k, board_square in ipairs(board_coordinates) do
                            if square_checked == board_square.id then
                                if not board_square.status.occupied then
                                    board_square.status.available_move = true
                                else
                                    checking_w = false
                                    if (string.sub(board_square.status.piece_id, 1, 1) == "R" and string.sub(selected_info.sel_piece_id, 1, 1) == "B") or (string.sub(board_square.status.piece_id, 1, 1) == "B" and string.sub(selected_info.sel_piece_id, 1, 1) == "R") then
                                        board_square.status.available_eat = true
                                    end
                                    break
                                end
                            end
                        end
                        aux_checking = aux_checking + 1
                        if string.byte(string.sub(selected_info.sel_square, 1, 1)) - aux_checking < string.byte("a") then
                            checking_w = false
                        end
                    end
                end
                checking_n = true
                aux_checking = 1
                if selected_info.selecting then
                    while checking_n do
                        square_checked = string.sub(selected_info.sel_square, 1, 1) .. string.char(string.byte(string.sub(selected_info.sel_square, 2, 2)) + aux_checking)
                        for k, board_square in ipairs(board_coordinates) do
                            if square_checked == board_square.id then
                                if not board_square.status.occupied then
                                    board_square.status.available_move = true
                                else
                                    checking_n = false
                                    if (string.sub(board_square.status.piece_id, 1, 1) == "R" and string.sub(selected_info.sel_piece_id, 1, 1) == "B") or (string.sub(board_square.status.piece_id, 1, 1) == "B" and string.sub(selected_info.sel_piece_id, 1, 1) == "R") then
                                        board_square.status.available_eat = true
                                    end
                                    break
                                end
                            end
                        end
                        aux_checking = aux_checking + 1
                        if string.byte(string.sub(selected_info.sel_square, 2, 2)) + aux_checking > string.byte("8") then
                            checking_n = false
                        end
                    end
                end
                checking_s = true
                aux_checking = 1
                if selected_info.selecting then
                    while checking_s do
                        square_checked = string.sub(selected_info.sel_square, 1, 1) .. string.char(string.byte(string.sub(selected_info.sel_square, 2, 2)) - aux_checking)
                        for k, board_square in ipairs(board_coordinates) do
                            if square_checked == board_square.id then
                                if not board_square.status.occupied then
                                    board_square.status.available_move = true
                                else
                                    checking_s = false
                                    if (string.sub(board_square.status.piece_id, 1, 1) == "R" and string.sub(selected_info.sel_piece_id, 1, 1) == "B") or (string.sub(board_square.status.piece_id, 1, 1) == "B" and string.sub(selected_info.sel_piece_id, 1, 1) == "R") then
                                        board_square.status.available_eat = true
                                    end
                                    break
                                end
                            end
                        end
                        aux_checking = aux_checking + 1
                        if string.byte(string.sub(selected_info.sel_square, 2, 2)) - aux_checking < string.byte("1") then
                            checking_s = false
                        end
                    end
                end
            end

            if string.sub(selected_info.sel_piece_id, 2, 2) == "K" or string.sub(selected_info.sel_piece_id, 2, 2) == "Q" then
                checking_ne = true
                aux_checking = 1
                if selected_info.selecting then
                    while checking_ne do
                        square_checked = string.char(string.byte(string.sub(selected_info.sel_square, 1, 1)) + aux_checking) .. string.char(string.byte(string.sub(selected_info.sel_square, 2, 2)) + aux_checking)
                        for k, board_square in ipairs(board_coordinates) do
                            if square_checked == board_square.id then
                                if not board_square.status.occupied then
                                    board_square.status.available_move = true
                                else
                                    checking_ne = false
                                    if (string.sub(board_square.status.piece_id, 1, 1) == "R" and string.sub(selected_info.sel_piece_id, 1, 1) == "B") or (string.sub(board_square.status.piece_id, 1, 1) == "B" and string.sub(selected_info.sel_piece_id, 1, 1) == "R") then
                                        board_square.status.available_eat = true
                                    end
                                    break
                                end
                            end
                        end
                        aux_checking = aux_checking + 1
                        if string.byte(string.sub(selected_info.sel_square, 1, 1)) + aux_checking > string.byte("h") then
                            checking_ne = false
                        end
                    end
                end
                checking_nw = true
                aux_checking = 1
                if selected_info.selecting then
                    while checking_nw do
                        square_checked = string.char(string.byte(string.sub(selected_info.sel_square, 1, 1)) - aux_checking) .. string.char(string.byte(string.sub(selected_info.sel_square, 2, 2)) + aux_checking)
                        for k, board_square in ipairs(board_coordinates) do
                            if square_checked == board_square.id then
                                if not board_square.status.occupied then
                                    board_square.status.available_move = true
                                else
                                    checking_nw = false
                                    if (string.sub(board_square.status.piece_id, 1, 1) == "R" and string.sub(selected_info.sel_piece_id, 1, 1) == "B") or (string.sub(board_square.status.piece_id, 1, 1) == "B" and string.sub(selected_info.sel_piece_id, 1, 1) == "R") then
                                        board_square.status.available_eat = true
                                    end
                                    break
                                end
                            end
                        end
                        aux_checking = aux_checking + 1
                        if string.byte(string.sub(selected_info.sel_square, 1, 1)) - aux_checking < string.byte("a") then
                            checking_nw = false
                        end
                    end
                end
                checking_se = true
                aux_checking = 1
                if selected_info.selecting then
                    while checking_se do
                        square_checked = string.char(string.byte(string.sub(selected_info.sel_square, 1, 1)) + aux_checking) .. string.char(string.byte(string.sub(selected_info.sel_square, 2, 2)) - aux_checking)
                        for k, board_square in ipairs(board_coordinates) do
                            if square_checked == board_square.id then
                                if not board_square.status.occupied then
                                    board_square.status.available_move = true
                                else
                                    checking_se = false
                                    if (string.sub(board_square.status.piece_id, 1, 1) == "R" and string.sub(selected_info.sel_piece_id, 1, 1) == "B") or (string.sub(board_square.status.piece_id, 1, 1) == "B" and string.sub(selected_info.sel_piece_id, 1, 1) == "R") then
                                        board_square.status.available_eat = true
                                    end
                                    break
                                end
                            end
                        end
                        aux_checking = aux_checking + 1
                        if string.byte(string.sub(selected_info.sel_square, 2, 2)) - aux_checking < string.byte("1") then
                            checking_se = false
                        end
                    end
                end
                checking_sw = true
                aux_checking = 1
                if selected_info.selecting then
                    while checking_sw do
                        square_checked = string.char(string.byte(string.sub(selected_info.sel_square, 1, 1)) - aux_checking) .. string.char(string.byte(string.sub(selected_info.sel_square, 2, 2)) - aux_checking)
                        for k, board_square in ipairs(board_coordinates) do
                            if square_checked == board_square.id then
                                if not board_square.status.occupied then
                                    board_square.status.available_move = true
                                else
                                    checking_sw = false
                                    if (string.sub(board_square.status.piece_id, 1, 1) == "R" and string.sub(selected_info.sel_piece_id, 1, 1) == "B") or (string.sub(board_square.status.piece_id, 1, 1) == "B" and string.sub(selected_info.sel_piece_id, 1, 1) == "R") then
                                        board_square.status.available_eat = true
                                    end
                                    break
                                end
                            end
                        end
                        aux_checking = aux_checking + 1
                        if string.byte(string.sub(selected_info.sel_square, 2, 2)) - aux_checking < string.byte("1") then
                            checking_sw = false
                        end
                    end
                end
            end

            if string.sub(selected_info.sel_piece_id, 2, 2) == "K" then
                for k, board_square in ipairs(board_coordinates) do
                    local col = string.byte(string.sub(board_square.id, 1, 1))
                    local row = string.byte(string.sub(board_square.id, 2, 2))        
                    -- if col >= sel_col - 1 and col <= sel_col + 1 then
                    --     if row >= sel_row - 1 and row <= sel_row + 1 and not board_square.status.occupied then
                    --         board_square.status.available_move = false
                    --     end
                    -- end
                    if col == sel_col - 1 or col == sel_col + 1 then
                        if (row == sel_row - 2 or row == sel_row + 2) then
                            if not board_square.status.occupied then
                                board_square.status.available_move = true
                            else
                                if (string.sub(board_square.status.piece_id, 1, 1) == "R" and string.sub(selected_info.sel_piece_id, 1, 1) == "B") or (string.sub(board_square.status.piece_id, 1, 1) == "B" and string.sub(selected_info.sel_piece_id, 1, 1) == "R") then
                                    board_square.status.available_eat = true
                                end
                            end
                        end
                    end
                    if col == sel_col - 2 or col == sel_col + 2 then
                        if (row == sel_row - 1 or row == sel_row + 1) then
                            if not board_square.status.occupied then
                                board_square.status.available_move = true
                            else
                                if (string.sub(board_square.status.piece_id, 1, 1) == "R" and string.sub(selected_info.sel_piece_id, 1, 1) == "B") or (string.sub(board_square.status.piece_id, 1, 1) == "B" and string.sub(selected_info.sel_piece_id, 1, 1) == "R") then
                                    board_square.status.available_eat = true
                                end
                            end
                        end
                    end
                end
            end
        end
        my_copy2 = changed_click
    end    
     
    -- Checking if the set up phase finished
    if my_copy3 ~= changed_click then
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
                    changing = true
                    phase = 1
                end
            end 
        end
        my_copy3 = changed_click
    end     

    -- Alternating the turns (phase 1)
    -- First, show all team pieces
    if my_copy4 ~= changed_click then
        if not changing then
            for k, piece in ipairs(pieces) do
                if string.sub(piece.id, 1, 1) == string.sub(text, 1, 1) then
                    piece.status.hidden = false
                else
                    piece.status.hidden = true
                end
            end
        end

        -- Second, change team if a valid move was made
        if phase == 1 then
            if moved % 2 == 0 then
                text = 'R - Make a move'
            else
                text = 'B - Make a move'
            end
        end
        my_copy4 = changed_click
    end    
end

function love.draw()
    local ww = love.graphics.getWidth()
    local wh = love.graphics.getHeight()
    local margin = 30

    local button_width = ww * (1/3)
    local button_height = 50
    local cursor_y = 100

    local total_height = (button_height + margin) * #buttons

    if game_menu == 0 then

        love.graphics.reset()
        love.graphics.scale(3.5, 3.5) 
        love.graphics.draw(love.graphics.newImage(image_path("Icon_Jogo")), (ww * 0.5 / 3.5 - 20), 25)
        love.graphics.reset()

        love.graphics.setColor(0.5, 0.5, 0.5, 1)
        game_name = "Battle of Wings"
        -- font = love.graphics.newFont(48)
        -- love.graphics.print(
        --     game_name,
        --         font,
        --         (ww * 0.5) - font:getWidth(game_name) * 0.5,
        --         235 + font:getHeight(game_name) * 0.5
        --     )
        love.graphics.scale(1.25, 1.25)
        love.graphics.draw(love.graphics.newImage(image_path("menu_logo")), 50, 200)
        love.graphics.reset()

        font = love.graphics.newFont(24)

        for i, button in ipairs(buttons) do
            button.last = button.now

            local bx = (ww * 0.5) - (button_width * 0.5)
            local by = (wh * 0.5) - (total_height * 0.5) + cursor_y

            local color = {0.4, 0.4, 0.5, 1.0}
            local mx, my = love.mouse.getPosition()

            local hot = mx > bx and mx < bx + button_width and
                        my > by and my < by + button_height

            if hot then
                color = {0.8, 0.8, 0.9, 1.0}
            end

            button.now = love.mouse.isDown(1)

            if button.now and not button.last and hot then
                button.fn()
            end

            love.graphics.setColor(unpack(color))
            love.graphics.rectangle(
                "fill",
                bx,
                by,
                button_width,
                button_height
            )

            love.graphics.setColor(0, 0, 0, 1)

            local textW = font:getWidth(button.text)
            local textH = font:getHeight(button.text)

            love.graphics.print(
                button.text,
                font,
                (ww * 0.5) - textW * 0.5,
                by + textH * 0.5
            )

            cursor_y = cursor_y + (button_height + margin)
        end
    elseif game_menu == 2 then
        love.graphics.reset() 
        love.graphics.scale(1, 1)
        love.graphics.draw(love.graphics.newImage(image_path("HTP_p1")), 0, 0)

        local b_x = 390
        local b_y = 830

        local m_x, m_y = love.mouse.getPosition()

        local hot2 = m_x > b_x and m_x < 535 and
                    m_y > b_y and m_y < 885

        local now = love.mouse.isDown(1)
        if hot2 then
            love.graphics.rectangle(
                "line",
                b_x,
                b_y,
                145,
                55
            )
            if now then
                game_menu = 3
            end
        end

    elseif game_menu == 3 then
        love.graphics.reset() 
        love.graphics.scale(1, 1)
        love.graphics.draw(love.graphics.newImage(image_path("HTP_p2")), 0, 0)

        local b_x = 5
        local b_y = 830

        local b_x2 = 180
        local b_y2 = 830

        local m_x, m_y = love.mouse.getPosition()

        local hot2 = m_x > b_x and m_x < 180 and
                    m_y > b_y and m_y < 885

        local hot3 = m_x > b_x2 and m_x < 365 and
                    m_y > b_y2 and m_y < 885

        local now2 = love.mouse.isDown(1)
        if hot2 then
            love.graphics.rectangle(
                "line",
                b_x,
                b_y,
                175,
                55
            )
            if now2 then
                game_menu = 2
            end
        end

        if hot3 then
            love.graphics.rectangle(
                "line",
                b_x2,
                b_y2,
                185,
                55
            )
            if now2 then
                game_menu = 0
            end
        end

    else
        love.graphics.reset() 
        love.graphics.scale(1.5, 1.5)
        -- Drawing the game board
        love.graphics.draw(images['board'], 30, 140)

        -- Drawing the pieces
        for k, piece in ipairs(pieces) do
            if piece.status.hidden and not piece.status.always_show then
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

        -- Drawing available eat
        for k, sq in ipairs(board_coordinates) do
            if sq.status.available_eat then
                love.graphics.draw(love.graphics.newImage(image_path("AE")), sq.position.x, sq.position.y)
            end
        end

            
        -- Drawing the orientation text
        love.graphics.print({{255, 255, 255}, text}, 0, 580, 0, 1, 1, -3, -3)
    end
end