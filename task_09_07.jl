function convert!(a :: Matrix)
    height = length(a[:,1])
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
