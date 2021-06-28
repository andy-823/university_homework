function pow_z(x, pow :: Int, n :: Int)
    res = 1
    while(pow > 0)
        if (mod(pow, 2) == 0)
            pow = div(pow, 2)
            x = (x * x) % n;
        else
            pow -= 1
            res = (res * x) % n;
        end
    end
    return res
end

function ord(a :: Int, p :: Int)
    for i in 1 : p - 1
        if ((p - 1) % i == 0)
            if (pow_z(a, i, p) == 1) return i end
        end
    end
end