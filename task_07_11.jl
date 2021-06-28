function factor(n :: Int) :: Vector{Int}
    ans :: Vector{Int} = []
    tmp = sqrt(n)
    for i in 2 : div(tmp, 1)
        if (mod(n, i ) == 0)
            push!(ans, i)
            while (mod(n, i ) == 0) n = div(n, i) end
        end
    end
    if (n > 1) push!(ans, n) end
    return ans
end

function nilpotents(n :: Int) :: Vector{Int}
    composition = 1
    for item in factor(n) composition *= item end

    ans :: Vector{Int} = []
    for i in 2 : n - 1
        if (i % composition == 0) push!(ans, i) end
    end
    return ans
end