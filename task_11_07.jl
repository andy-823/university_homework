using Base: Float64
vec_prod(x1, y1, x2, y2, x3, y3) = (x1 - x2) * (y3 - y2) - (x3 - x2) * (y1 - y2);


function is_convex(a :: Vector{Pair{Float64, Float64}})
    big :: Int = 0
    small :: Int = 0
    n :: Int = length(a);
    x = Vector{Float64}(undef, n)
    y = Vector{Float64}(undef, n)

    for i in 1 : n
        x[i] = a[i].first
        y[i] = a[i].second
    end

    tmp = vec_prod(x[2], y[2], x[1], y[1], x[n], y[n]);

    if (tmp > 0) big += 1 end
    if (tmp < 0) small += 1 end   

    tmp = vec_prod(x[1], y[1], x[n], y[n], x[n - 1], y[n - 1]);

    if (tmp > 0) big += 1 end
    if (tmp < 0) small += 1 end 

    for i in 2 : n - 1
        tmp = vec_prod(x[i + 1], y[i + 1], x[i], y[i], x[i - 1], y[i - 1]);
        if (tmp > 0) big += 1 end
        if (tmp < 0) small += 1 end
    end

    if (big * small == 0) return true
    else return false end
end