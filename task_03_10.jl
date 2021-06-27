function gcd(a :: Int, b :: Int) :: Int
    if (b > a) a, b = b, a end
    if (b == 0) return a end
    return gcd(b, mod(a, b))
end

function move(x :: Vector, m :: Int64)
    len = length(x)
    first = gcd(len, m)
    second = div(len, first)
    for i in 1 : first
        index = i - 1
        prev = x[index + 1]
        for j in 1 : second
            index = mod(index + m, len)
            prev, x[index + 1] = x[index + 1], prev 
        end
    end
    return x
end