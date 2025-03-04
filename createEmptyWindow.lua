return function (main, windows)
    table.insert(windows, main:addFrame():setPosition(1, 1):setSize("parent.w", "parent.h"))
end