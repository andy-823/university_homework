function shenken_sort(x)
    len = length(x)
    left = 1;
    right = len;
    while (left <= right)
        i = right
        while (i > left)
            if (x[i - 1] > x[i]) x[i - 1], x[i] = x[i], x[i - 1] end
            i -= 1
        end
        left += 1;
        for i in left : right
            if (x[i - 1] > x[i]) x[i - 1], x[i] = x[i], x[i - 1] end
        end
        right -= 1;
    end
    return x
end