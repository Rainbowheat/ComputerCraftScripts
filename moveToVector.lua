function moveToAnotherVector (whereToGo, whereAm) --always assume looking in z axis at start 

    xDisplaceMent = whereToGo.x - whereAm.x
    yDisplaceMent = whereToGo.y - whereAm.y
    zDisplaceMent = whereToGo.z - whereAm.z

    print(whereToGo)
    print(whereAm)

    function xForward(displaceMent)

        local normalisedDisplaceMent = 0

        if displaceMent > 0 then
            turtle.turnLeft()
            normalisedDisplaceMent = displaceMent
        elseif displaceMent < 0 then
            turtle.turnRight()
            normalisedDisplaceMent = displaceMent * -1
        end
        
        if displaceMent ~= 0 then
            
            i = 0
            while i < normalisedDisplaceMent do
                if turtle.forward() then
                    i=i+1
                    print(i)
                else
                    turtle.dig()
                end
            end
        end

        if displaceMent < 0 then
            turtle.turnLeft()
        elseif displaceMent > 0 then
            turtle.turnRight()
        end
    end

    function zForward(displaceMent)

        local normalisedDisplaceMent = 0

        if displaceMent < 0 then
            turtle.turnLeft()
            turtle.turnLeft()
            normalisedDisplaceMent = displaceMent * -1
        else
            normalisedDisplaceMent = displaceMent
        end
        
        
        if displaceMent ~= 0 then
            i = 0
            while i < normalisedDisplaceMent
            do
                if turtle.forward() then
                    i=i+1
                else
                    turtle.dig()
                end
            end
        end
        

        if displaceMent < 0 then
            turtle.turnLeft()
            turtle.turnLeft()
        end
        
    end

    function yForward(displaceMent)
        if displaceMent ~= 0 then
            if displaceMent > 0 then
                i = 0
                while i < displaceMent
                do
                    if turtle.up() then
                        i=i+1
                    else
                        turtle.digUp()
                    end
                end
            else
                displaceMent = -displaceMent

                i = 0
                while i < displaceMent
                do
                    if turtle.down() then
                        i=i+1
                    else
                        turtle.digDown()
                    end
                end
            end
        end
    end
    
    zForward(zDisplaceMent)

    xForward(xDisplaceMent)

    yForward(yDisplaceMent)
    
end

print("where to go x: ")

xW = tonumber(read())

print("where to go y: ")

yW = tonumber(read())

print("where to go z: ")

zW = tonumber(read())

print("moving now!!!")

whereGoing = vector.new(xW, yW, zW)

moveToAnotherVector(whereGoing, vector.new(0,0,0))