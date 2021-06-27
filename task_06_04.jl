function binomial_coeffs_1(n :: Integer)
    c = NTuple{0,Int}() # пустой кортеж типа Int
    if (n == 1) c = (1) end
    for _ in 2 : n
        c=(1, (c[1 : end - 1] .+ c[2 : end])..., 1)
    end
    return c
end

function binomial_coeffs_2(n :: Integer)
    c=Int[]
    if (n == 1) c = [1] end
    for _ in 2 : n
        for i in 1 : length(c) - 1
            c[i] = c[i] + c[i + 1]
        end
        c = vcat(1, c[1 : end - 1], 1)
    end
    return c
end

function binomial_coeffs_3(n :: Integer)
    c = Int[]
    if (n == 1) c = [1] end
    for i in 2 : n
        for j in 1 : length(c) - 1
            c[j] = c[j] + c[j + 1]
        end

        if (mod(i, 2) == 0)
            c = vcat(1, c[1 : end - 1])
        else
            c[end] *= 2
            c = vcat(1, c)
        end
    end
    return c
end