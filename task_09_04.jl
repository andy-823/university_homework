function my_ln(x)
    flag = false
    if (x > 1)
        x = 1 / x
        flag = true
    end
        
    my_coeff = x - 1
    my_degree = 0
    tmp = my_coeff

    res = my_coeff
    tmp = res
    
    while (res != res - tmp)
        my_degree += 1
        my_coeff *= -1 * (x - 1)
        tmp = my_coeff / (my_degree + 1)
        res += tmp
    end

    if (flag = true) res *= -1 end

    return res
end

function my_sqrt(x)
    flag = false
    if (x > 1)
        x = 1 / x
        flag = true
    end

    x -= 1
    res = 1
    my_k = 1
    my_coeff = 1

    while (res != res - my_coeff)
        my_coeff *= -1 * (2 * my_k - 1) * x / (2 * my_k)
        res += my_coeff
        my_k += 1
    end

    if (flag == false) res = 1 / res end

    return res
end

function strange_function(x) #x * sin(x) - e^(-x^2)
    if (x > 1)
        println("it doesnt work with numbers > 1")
        return -1
    end

    x *= x
    my_coeff = x

    res = 2 * x
    my_k = 2

    factorial_1 = 1
    factorial_2 = 1

    while (res != res - my_coeff)
        factorial_1 *= my_k
        factorial_2 *= (2 * my_k - 2) * (2 * my_k -1)

        my_coeff *= -1 * x
        res += my_coeff * (1 / factorial_1 + 1 / factorial_2)
        my_k += 1
    end

    return res
end