function my_log(a, b, e)
    z, t, y = b, 1, 0
#ИНВАРИАНТ: a^y * z^t == x (=const)
    while z > a || z < 1/a || t > e   
        if z > a
            z /= a
            y += t # т.к. z^t = (z/a)^t * a^t
        elseif z < 1/a
            z *= a
            y -= t # т.к. z^t = (z*a)^t * a^-t
        else # t > ε
            t /= 2
            z *= z # т.к. z^t = (z*z)^(t/2)
        end
    end
    return y
end