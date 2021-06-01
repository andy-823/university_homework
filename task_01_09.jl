#here i have to malke insert sort
#i made here 2 additional functions: move which moves a part of array on 1 index right and find_index which finds the element index

function insertsort!(x)
    len = length(x)
    for i in 2 : len
        index = find_index(x, x[i], i - 1) #we find index which the element will have
        tmp = x[i] #we remember it as we will lose it in array while moving
        move(x, index, i) #we move array on 1 index right
        x[index] = tmp #and change the element
    end
    return x
end

function find_index(x, element, last)
    if (last == 1)
        if (x[1] > element)
            return 1
        else
            return 2
        end
    end
    right = last
    left = 1
    while (right != left + 1)
        mid = div(right + left, 2)
        if (x[mid] < element)
            left = mid
        else
            right = mid
        end  
    end
    if (x[left] > element)
        return left
    elseif (x[right] > element)
        return right
    else
        return right + 1
    end
end

function move(x, first, last)
    i = last
    while (i > first)
        x[i] = x[i - 1]
        i -= 1
    end
end
