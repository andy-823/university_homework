function particle_sort(x, value)
    last_lower = 0
    last_equal = 0

    len = length(x)
    for i in 1 : len
        if (x[i] == value) 
            x[i], x[last_equal + 1] = x[last_equal + 1], x[i]
            last_equal += 1
        end
        if (x[i] < value)
            x[i], x[last_lower + 1] = x[last_lower + 1], x[i]
            last_lower += 1
            # x[i] now >= value, if x == value we know what to do, if x > value there are no equal to value yet 
            x[i], x[last_equal + 1] = x[last_equal + 1], x[i]
            last_equal += 1
        end
    end
end