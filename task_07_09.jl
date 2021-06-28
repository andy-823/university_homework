function ext_euc(m, n)
    a, b = m, n
    u_a, v_a = 1, 0
    u_b, v_b = 0, 1

    while b != 0
        k = div(a,b)
        a, b = b, a % b 
        #УТВ: a % b = a-k*b - остаток от деления a на b
        u, v = u_a, v_a
        u_a, v_a = u_b, v_b
        u_b, v_b = u - k * u_b, v - k*v_b
    end
    return [u_a, v_a]
end

function gcd(a :: Int, b :: Int) :: Int
    if (b > a) a, b = b, a end
    if (b == 0) return a end
    return gcd(b, mod(a, b))
end

function inv(m::Integer,n::Integer)
    if gcd(n, m) > 1 return nothing end
    x = ext_euc(m, n)[2]
    while (x < 0) x += m end
    return x % m
end