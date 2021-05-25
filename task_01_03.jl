bubblesort(x :: Vector) = bubblesort!(copy(x))

function bubblesort!(x :: Vector)
    for i in 1 : length(x) - 1
        for j in i + 1 : length(x)
            if (x[i] > x[j])
                x[j], x[i] = x[i], x[j]
            end
        end
    end
    return x
end

bubblesortperm(x :: Vector) = bubblesortperm!(copy(x))

function bubblesortperm!(x :: Vector)
    len = length(x)
    res = [len]
    for i in 1 : len res[i] = i 
    for i in 1 : len - 1
        for j in i + 1 : len
            if (x[i] > x[j])
                x[j], x[i] = x[i], x[j]
                res[j], res[i] = res[i], res[j]
            end
        end
    end
end
