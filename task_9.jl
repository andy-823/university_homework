function great_painter(r::Robot)
    k=1
    side=Nord
    while ismarker(r)==false
        for _ in 1:2
            check_mark(r,side,k)
            side=next(side)
        end
        k+=1
    end
end

function check_mark(r::Robot, side::HorizonSide, num_steps::Int)
    for _ in 1:num_steps
        move!(r,side)
        if ismarker(r)==true
            break
        end
    end
end

next(side::HorizonSide)=HorizonSide(mod(Int(side)+3,4))