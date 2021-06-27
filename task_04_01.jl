# x - vector of coefficients of polynom
function find_diff2(x :: Vector, x_point)
    res = 0
    len = length(x)
    for i in len : -1 : 3
        res = res * x_point + (i - 1) * (i - 2) * x[i] 
    end
    return res
end