function linsolve(a :: Matrix, b :: Vector)
    c :: Vector = []

    len = length(a)
    height = length(a[:,1])
    width = div(len, height)

    if (height != width) for i in height + 1 : width push!(c, 0) end end
    for i in height : -1 : 1
        sum = 0
        for j in 1 : length(c) sum += c[j] * a[i, width - j + 1] end
        if (a[i, i] != 0)
            push!(c, (b[i] - sum) / a[i, i])
        else
            push!(c, 0)
        end
    end
    return reverse!(c)
end

function convert!(a :: Matrix)
    height = length(a[:, 1])
    for i in 2 : height
        for j in i : height
            coeff1 = a[i - 1, i - 1]
            coeff2 = a[j, i - 1]
            if (coeff1 == 0)
                a[j, :], a[i - 1, :] = a[i - 1, :], a[j, :]
                coeff1, coeff2 = coeff2, coeff1
            end
            if (coeff2 == 0) continue end
            a[j, :] -=  a[i - 1, :] * coeff2 / coeff1
        end
    end
end

function rang(a :: Matrix)
    convert!(a)
    height = length(a[:, 1])
    width = length(a[1, :])

    rang = 0
    for i in 1 : height
        zero :: Bool = true
        for item in a[i, :] zero = zero && item != 0  end
        if (!zero) rang += 1 end
    end
    return rang
end

function solve(a :: Matrix)
    if (rang(a) != rang(a[:, begin : end - 1])) return nothing end

    return linsolve(a[:, begin : end - 1], a[:, end])
end