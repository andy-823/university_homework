function newton(r::Function, x; ε_x = 1e-8, ε_y = 1e-8, nmaxiter = 20)
    return newton_func(r, x, nmaxiter; ε_x)
end

function newton_func(r::Function, x, iter)
    x1 = r(x)
    if (x1 == 0) return x - x1 end
    if (iter < 0) return nothing end
    return newton_func(r, x - x1, iter - 1)
end