function nummax(x)
    len = length(x)
    max = x[1]
    num_max = 1
    for i in 2 : len
        if (x[i] == max)
            num_max += 1
        end
        if (x[i] > max)
            max = x[i]
            num_max = 1
        end
    end
    return num_max
end