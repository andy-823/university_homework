using Base: Bool
function eratosphen(n :: Int) :: Vector{Int}
    arr :: Vector{Bool} = [true]
    for i in 1 : n push!(arr, false) end

    tmp = sqrt(n)
    i :: Int = 2
    while i <= tmp
        for j in 2 : div(n, i) arr[i * j] = true end
        i += 1
    end
    
    ans :: Vector{Int} = []
    for i in 1 : n
        if !arr[i] push!(ans, i) end
    end
    return ans
end
    
