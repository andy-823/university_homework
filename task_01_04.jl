bubblesort(x :: Matrix) = bubblesort!(copy(x))

bubblesort!(x :: Matrix) = reshape(bubblesort!(x[:]), size(x)...)

bubblesortperm(x :: Matrix) = bubblesortperm!(copy(x))

bubblesortperm!(x :: Matrix) = reshape(bubblesortperm!  (x[:]), size(x)...)