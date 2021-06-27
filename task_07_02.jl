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

fibonacci(n :: Int) = pow([1 1; 1 0], n - 1)[1, 1]