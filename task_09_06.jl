function linsolve(a :: Matrix, b :: Vector)
    c :: Vector = []

    len = length(a)
    height = length(a[:,1])
    width = div(len, height)

    push!(c, b[height] / a[height, width])
    for i in height - 1 : -1 : 1
        sum = 0
        for j in 1 : length(c) sum += c[j] * a[i, width - j + 1] end
        push!(c, (b[i] - sum) / a[i, i])
    end

    return reverse!(c)
end