# Here i have to find the vector of numbers where function is max

function findallmax(func::Function, x)
    len = length(x)
    max = func(x[1])
    res = []
    push!(res, 1)
    for i in 2 : len
        value = func(x[i])
        if (value > max)
            max = value
            res = []
            push!(res, i)
        end
        if (value == max)
            push!(res, i)
        end
    end
end