# here i have to transpose 2d array
function transpose(x::Matrix)
    
    len = length(x)
    height = length(x[:,1])
    width = div(len, height)

    res = eltype(x)[]

    for row in 0 : height - 1
        for column in 0 : width - 1
            push!(res, x[column * height + row + 1])
        end
    end
    return reshape(res, div(len, height), height)
end