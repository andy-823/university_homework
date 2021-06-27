#shakersort, a kind of bubblesort
#this function sorts  1-dimensional array
#you can set the first item to sort from and the last one to sort to (default are 1st and the last)

#note: the first array number is 1, not 0 

function shakersort(x, start = 1 ::Int, n = length(x) ::Int)
    left = start + 1
    right = n
    while (left <= right)
        i = right
        while (i >= left)
            if (x[i-1] > x[i]) x[i-1], x[i] = x[i], x[i-1] end
            i -= 1
        end
        left += 1
        i = left
        while (i <= right)
            if (x[i-1] > x[i]) x[i-1], x[i] = x[i], x[i-1] end
            i += 1
        end
        right -= 1
    end
end