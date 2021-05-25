function copy_my(x :: Vector)
    res = []
    for elem in x
        push!(res, elem)
    end
    return res
end

copy_my(x :: Matrix) = reshape(copy_my(x[:]), size(x)...)