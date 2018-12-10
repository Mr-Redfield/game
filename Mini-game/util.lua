function checkMousePosIn(mouseX, mouseY, centerX, centerY,r)
    local distance = math.sqrt(math.pow(mouseX - centerX, 2) + math.pow(mouseY - centerY, 2 ))
    if (distance <= r) then
        return true
    else
        return false
    end
end