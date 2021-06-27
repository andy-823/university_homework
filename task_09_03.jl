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

function build_graph()
    # x = [];
    # y = []
    # x_ = 0
    # while (x_ < pi)
    #     push!(x, x_)
    #     push!(y, my_cos(x, 2))
    #     x_ += 0.01
    #     #plot(x_, my_cos(x_, 2), label = "n = 2")
    # end
    
    lineplot(my_cos(x, 2))
end
