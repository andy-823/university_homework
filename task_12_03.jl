using Base: Float64
function square(a :: Vector{Pair{Float64, Float64}})
    n :: Int = length(a);
    x = Vector{Float64}(undef, n)
    y = Vector{Float64}(undef, n)

    for i in 1 : n
        x[i] = a[i].first
        y[i] = a[i].second
    end

    s = (y[n] + y[1]) * (x[n] - x[1])
    for i in 1 : n - 1 s += (y[i] + y[i + 1]) * (x[i] - x[i + 1]) end

    return abs(s) / 2;
end
