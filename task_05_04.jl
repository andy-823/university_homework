mutable struct Polynom{T}
    coeff::Vector{T}
end

function find_diffk(x :: Vector, x_point, k :: Int)
    res = 0
    len = length(x)
    for i in len : -1 : (k + 1)
        res = res * x_point + psevdofact(i - 1, k) * x[i] 
    end
    return res
end

function psevdofact(a, k) :: Int
    res = a
    for i in k : a - 1 res = res * i end
    return res
end

diff(p :: Polynom, x; ord = 1) = find_diffk(p.coeff, x, ord)