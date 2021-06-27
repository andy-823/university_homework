function pow(a, n::Integer)
    degree :: Integer = 1;
    a_deg = []
    push!(a_deg, a)

    while degree < n
        a *= a
        degree *= 2
        push!(a_deg, a)
    end

    i = length(a_deg)
    res = 1

    while (n > 0 && i > 0)
        if (n >= degree)
            res *= a_deg[i]
            n -= degree
        end
        degree = div(degree, 2)
        i -= 1 
    end

    return res
end