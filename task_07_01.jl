function pow(x, pow :: Int)
    res = 1
    while(pow > 0)
        if (mod(pow, 2) == 0)
            pow = div(pow, 2)
            x *= x;
        else
            pow -= 1
            res *= x;
        end
    end
    return res
end
