using Base: Float64

vec_prod(x1, y1, x2, y2, x3, y3) = (x1 - x2) * (y3 - y2) - (x3 - x2) * (y1 - y2);

function square(a :: Vector{Pair{Float64, Float64}})
    n :: Int = length(a);
    x = Vector{Float64}(undef, n)
    y = Vector{Float64}(undef, n)

    for i in 1 : n
        x[i] = a[i].first
        y[i] = a[i].second
    end

    s :: Float64 = 0
    for i in 2 : n - 1 s += vec_prod(x[i], y[i], x[1], y[1], x[i + 1], y[i + 1]) end

    return abs(s) / 2;
end