using Base: Bool
function prime(x :: Int) :: Bool
    tmp = sqrt(x)
    i :: Int = 2
    while (i <= tmp)
        if mod(x, i) == 0 return false end
        i += 1
    end
    return true
end