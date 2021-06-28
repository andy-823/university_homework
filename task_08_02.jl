function mergesort!(a)
    k = 2
    len = length(a)
    while k / 2 <= len
        for i in 0 : div(len, k)
            first = k * i + 1
            last = k * (i + 1)
            mid = k * i + 1 + div(k, 2)
            if (mid > len) continue end
            if (last > len) last = len end
            a[first : last] = merge(a[first : mid - 1], a[mid : last])
        end
        k *= 2
    end
end

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