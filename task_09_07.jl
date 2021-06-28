# it may work incorrectly with zero rows
function convert!(a :: Matrix)
    height = length(a[:,1])
    for i in 2 : height
        for j in i : height
            coeff1 = a[i - 1, i - 1]
            coeff2 = a[j, i - 1]
            if (coeff2 == 0) continue end
            a[j, :] -=  a[i - 1, :] * coeff2 / coeff1
        end
    end
end