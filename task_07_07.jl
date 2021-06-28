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

function eiler(n :: Int)
    degrees  :: Vector{Int} = []
    dividors :: Vector{Int} = []

    tmp = sqrt(n)
    for i in 2 : div(tmp, 1)
        if (mod(n, i ) == 0)
            push!(dividors, i)
            push!(degrees, 0)
            while (mod(n, i ) == 0)
                degrees[end] += 1
                n = div(n, i) 
            end
        end
    end
    if (n > 1)
        push!(dividors, n)
        push!(degrees, 1)
    end
    ans = 1
    for i in 1 : length(dividors)
        ans *= pow(dividors[i], degrees[i]) - pow(dividors[i], degrees[i] - 1)
    end
    return ans
end