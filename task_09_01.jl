function my_cos(x, n::Int64)
    my_coeff = 1
    my_degree = 0

    res = 1
    tmp = res
    x *= x

    while (my_degree < n)
        my_degree +=2
        my_coeff *= x / (-1 * (my_degree - 1) * my_degree)
        res += my_coeff
    end

    return res
end