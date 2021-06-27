# x - vector of coefficients of polynom
function find_diff3(x :: Vector, x_point)
    res = 0
    len = length(x)
    for i in len : -1 : 4
        res = res * x_point + (i - 1) * (i - 2) * (i - 3) * x[i] 
    end
    return res
end
