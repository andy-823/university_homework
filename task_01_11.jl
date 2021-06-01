function findallmax(x)
    len = length(x)
    max = x[1]
    res = []
    push!(res, 1)
    for i in 2 : len
        if (x[i] == max)
            push!(res, i)
        end
        if (x[i] > max)
            max = x[i]
            res = []
            push!(res, i)
        end
    end
    return res
end