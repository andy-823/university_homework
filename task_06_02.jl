function particle_sort_1(x, value)
    lower = []
    equal = []
    bigger = []
    for item in x
        if (item < value) push!(lower, item) end
        if (item == value) push!(equal, item) end
        if (item > value) push!(bigger, item) end
    end
    x = vcat(lower, equal, bigger)
end

function particle_sort_2(x, value)
    last_lower = 0
    last_equal = 0

    len = length(x)
    for i in 1 : len
        if (x[i] < value)
            x[i], x[last_lower + 1] = x[last_lower + 1], x[i]
            last_lower += 1
            if (last_lower - last_equal == 1) last_equal = last_lower end
        end
        if (x[i] == value) 
            x[i], x[last_equal + 1] = x[last_equal + 1], x[i]
            last_equal += 1
        end
    end
end
