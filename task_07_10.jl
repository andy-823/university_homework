function gcd(a :: Int, b :: Int) :: Int
    if (b > a) a, b = b, a end
    if (b == 0) return a end
    return gcd(b, mod(a, b))
end

function zerodividers(n :: Int) :: Vector{Int}
    ans :: Vector{Int} = []
    for i in 2 : n - 1
        if (gcd(i, n) > 1) push!(ans, i) end
    end
    return ans
end