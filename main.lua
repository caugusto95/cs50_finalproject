-- To Do
    -- Setup do Jogo
        -- Desenhar o tabuleiro OK
        -- Criar as classes das peças
            -- Nome
            -- Cor
            -- Valor
            -- Como movimenta
            -- Se está revelada ou não
    -- Inicio do jogo
        -- Como posicionar as peças
        -- Estrutura de turnos
            -- Como faz movimentos
            -- Como come peças
            -- Como revela as peças
    -- Fim do Jogo
        -- Check se condição de fim de jogo foi atingida

-- Import helpers functions
require('helpers')
-- Array of sprites of the game
local images = {}

-- Create Orientation Text
local text = 'Set up your pieces'

-- Game over variable
local gameover = false

-- Array of pieces
local pieces = {
    {x = 0 * 40 + 20, y = 0 * 40, id = 'B2'},
    {x = 1 * 40 + 20, y = 0 * 40, id = 'B2'},
    {x = 2 * 40 + 20, y = 0 * 40, id = 'B3'},
    {x = 3 * 40 + 20, y = 0 * 40, id = 'B3'},
    {x = 4 * 40 + 20, y = 0 * 40, id = 'B4'},
    {x = 5 * 40 + 20, y = 0 * 40, id = 'B4'},
    {x = 6 * 40 + 20, y = 0 * 40, id = 'B5'},
    {x = 7 * 40 + 20, y = 0 * 40, id = 'B5'},
    {x = 0 * 40 + 20, y = 1 * 40, id = 'B6'},
    {x = 1 * 40 + 20, y = 1 * 40, id = 'B6'},
    {x = 2 * 40 + 20, y = 1 * 40, id = 'B7'},
    {x = 3 * 40 + 20, y = 1 * 40, id = 'B7'},
    {x = 4 * 40 + 20, y = 1 * 40, id = 'BJ'},
    {x = 5 * 40 + 20, y = 1 * 40, id = 'BJ'},
    {x = 6 * 40 + 20, y = 1 * 40, id = 'BK'},
    {x = 7 * 40 + 20, y = 1 * 40, id = 'BK'},
    {x = 2 * 40 + 10, y = 2 * 40, id = 'BQ'},
    {x = 3 * 40 + 10, y = 2 * 40, id = 'BQ'},
    {x = 4 * 40 + 10, y = 2 * 40, id = 'BA'},
    {x = 5 * 40 + 10, y = 2 * 40, id = 'BA'},
    {x = 6 * 40 + 10, y = 2 * 40, id = 'BT'},
    {x = 0 * 40 + 20, y = 11 * 40, id = 'R2'},
    {x = 1 * 40 + 20, y = 11 * 40, id = 'R2'},
    {x = 2 * 40 + 20, y = 11 * 40, id = 'R3'},
    {x = 3 * 40 + 20, y = 11 * 40, id = 'R3'},
    {x = 4 * 40 + 20, y = 11 * 40, id = 'R4'},
    {x = 5 * 40 + 20, y = 11 * 40, id = 'R4'},
    {x = 6 * 40 + 20, y = 11 * 40, id = 'R5'},
    {x = 7 * 40 + 20, y = 11 * 40, id = 'R5'},
    {x = 0 * 40 + 20, y = 12 * 40, id = 'R6'},
    {x = 1 * 40 + 20, y = 12 * 40, id = 'R6'},
    {x = 2 * 40 + 20, y = 12 * 40, id = 'R7'},
    {x = 3 * 40 + 20, y = 12 * 40, id = 'R7'},
    {x = 4 * 40 + 20, y = 12 * 40, id = 'RJ'},
    {x = 5 * 40 + 20, y = 12 * 40, id = 'RJ'},
    {x = 6 * 40 + 20, y = 12 * 40, id = 'RK'},
    {x = 7 * 40 + 20, y = 12 * 40, id = 'RK'},
    {x = 2 * 40 + 10, y = 13 * 40, id = 'RQ'},
    {x = 3 * 40 + 10, y = 13 * 40, id = 'RQ'},
    {x = 4 * 40 + 10, y = 13 * 40, id = 'RA'},
    {x = 5 * 40 + 10, y = 13 * 40, id = 'RA'},
    {x = 6 * 40 + 10, y = 13 * 40, id = 'RT'}    
}

--Variable to define whats being selected
selected = 0

-- Function to help the writing of the images paths
function image_path(image_name)
    return string.format('images/%s.png', image_name)
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

-- Getting mouse input
local mx, my = love.mouse.getPosition()

-- Checking which piece is clicked and being moved
-- if selected == 0 then
--     if love.mouse.isDown(1) then
--         for index_piece, place_piece in ipairs(pieces) do
--             if in_range(mx, place_piece.x, place_piece.x + 39) and in_range(mx, place_piece.y, place_piece.y + 39) then
--                 selected = index_piece
    
--     end
-- end

end

function love.draw()
    -- Drawing the game board
    love.graphics.draw(images['board'], 20, 120)
    -- Drawing the starting place of the pieces
    for index_piece, place_piece in ipairs(pieces) do
        if index_piece ~= selected then
            if in_range(place_piece.x, 0, 320) then
                love.graphics.draw(images[place_piece.id], place_piece.x, place_piece.y)
            end
        end
    end

    -- Drawing the new places of the pieces


    -- Drawing the orientation text
    love.graphics.print({{255, 255, 255}, text}, 0, 560, 0, 1, 1, -3, -3)
end