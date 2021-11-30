function love.load()
    target = {}
    target.x = 300
    target.y = 300
    target.radius = 40
    score = 0
    gameFont = love.graphics.newFont(20)
    font = love.graphics.newFont(80)
    timer = 10
    timerScore = 5
    colour = 1
end
function love.update(dt)
    if timer >= 0 then
        timer = timer - dt
        timerScore = timerScore - dt
    end
end
function love.draw()
    --[[   love.graphics.setFont(gameFont)
    love.graphics.print('Easy', 100, 100)
    love.graphics.print('Medium', 200, 100)
    love.graphics.print('Hard', 300, 100)
    love.graphics.print('I hate Myself', 500, 100)
    crosshair colour red ]]

    function hard()
        love.graphics.setColor(0, colour, 0)
        love.graphics.circle("fill", target.x, target.y, target.radius)
        love.graphics.setColor(1, 1, 1)
        love.graphics.setFont(gameFont)
        love.graphics.print('Score', 0, 0)
        love.graphics.print(math.floor(score), 150, 0)
        love.graphics.print('Seconds Left', 500, 0)
        love.graphics.print(math.floor(timer), 700, 0)
        if timer <= 0 then
            love.graphics.clear(0, 0, 0, 0)
            love.graphics.setFont(font)
            love.graphics.print('Game over', 200, 300)
            love.graphics.print('Your Score ', 200, 0)
            love.graphics.print(math.floor(score), 400, 100)
            colour = 0
            love.graphics.rectangle("fill", 200, 200, 400, 100)
            love.graphics.setColor(0, 1, 0)
            love.graphics.print('Try Again ', 200, 200)

            function love.mousepressed(x, y, button, istouch, presses)
                if button == 1 then
                    love.load()
                end
            end
        end
    end
    hard()
end
function love.mousepressed(x, y, button, istouch, presses)
    if timer >= 0 then
        if button == 1 then
            local mouseTarget = distance(x, y, target.x, target.y)
            if mouseTarget < target.radius then
                -- Score + depends on how fast you click the circle, the score goes back to 5 and countsdown to less every second
                score = score + timerScore
                timerScore = 5
                target.x = math.random(target.radius, love.graphics.getWidth() - target.radius)
                target.y = math.random(target.radius, love.graphics.getHeight() - target.radius)
                timer = timer + 0.5
                -- lets up the game difficulty by decreasing the radius of the circle
                if target.radius > 12 then
                    target.radius = target.radius - 3
                end
            end
        end
    end
end
function distance(x1, y1, x2, y2)
    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

