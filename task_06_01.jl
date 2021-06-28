function merge(a, b)
    c = []
    index1 = 1
    index2 = 1

    while (index1 <= length(a) && index2 <= length(b))
        if (a[index1] < b[index2])
            push!(c, a[index1])
            index1 += 1
        else
            push!(c, b[index2])
            index2 += 1
        end
    end

    tmp1 = length(a)
    tmp2 = length(b)

    if (index1 <= length(a))
        for i in index1 : tmp1
            push!(c, a[i])
        end
    else
        for i in index2 : tmp2
            push!(c, b[i])
        end
    end
    
    return c
end

function merge!(A,B,C)
    C = merge(A, B)
end
