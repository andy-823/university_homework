#here i have to create something like standart reverse function

function reverse_my(x :: Vector)
    res = []
    len = length(x)
    for i in 1 : len
        push!(res, x[len - i + 1])
    end
    return res
end

reverse_my(x :: Matrix) = reshape(reverse_my(x[:]), size(x)...)