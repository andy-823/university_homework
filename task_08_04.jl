function partsort1!(x, value)
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
    return [x, last_lower, last_equal]
end

function partsort2!(x, value)
    last = 0

    len = length(x)
    for i in 1 : len
        if (x[i] <= value) 
            x[i], x[last + 1] = x[last + 1], x[i]
            last += 1
        end
    end
    return [x, last]
end

function quicksort1!(a)
    if isempty(a)
        return a
    end
    a, i, j = partsort1!(a,a[rand(1 : length(a))]) 
    quicsort!(@view a[begin:i])
    quicsort!(@view a[j+1:end])
    return a
end

function quicksort2!(a)
    if isempty(a)
        return a
    end
    a, i = partsort2!(a,a[rand(1 : length(a))]) 
    quicsort!(@view a[begin : i])
    quicsort!(@view a[i + 1 : end])
    return a
end