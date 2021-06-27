function log2(a::Float64, b::Float64, e::Float64)
    if (b < 1) return -normal_log(a, 1/b, e, 1) end
    return normal_log(a, b, e, 1)
end

function normal_log(a::Float64, b::Float64, e::Float64, p)
    if abs(a - 1) < e return 0 end

    tmp = b
    p0 = 1
    while (tmp < a)
        tmp *= b
        p0 += 1
    end
    p *= p0

    b = tmp / a

    return 1 + 1 / p * normal_log(a, b, e, p)
end