function great_painter(r::Robot)
    num_ver=moves!(r,Sud)
    num_hor=moves!(r,West)
    num_ver+=moves!(r,Sud)
    side=Nord
    while isborder(r,Ost)==false
        while isborder(r,side)==false
            move!(r,side)
            if isborder(r,Ost)==true
                break
            end           
        end
        if isborder(r,Ost)==false
            move!(r,Ost)
        end
        side=inverse(side)
    end
    while isborder(r,Ost)==true
        move!(r,Sud)
    end
    side=Nord
    move!(r,Nord)
    for _ in 1:4
        putmarker!(r)
        while isborder(r,next(side))==true
            move!(r,side)
            putmarker!(r)
        end
        side=next(side)
        move!(r,side)
    end
    moves!(r,Sud)
    moves!(r,West)
    move_back(r,Nord,num_ver)
    move_back(r,Ost,num_hor)
end

function moves!(r::Robot,side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=1
    end
    return num_steps
end

function move_back(r::Robot,side::HorizonSide,num_steps::Int)
    if (num_steps<0)==true
        side=inverse(side)
        num_steps*=-1
    end
    for _ in 1:num_steps
        move!(r,side)
    end
end

inverse(side::HorizonSide)=HorizonSide(mod(Int(side)+2,4))

next(side::HorizonSide)=HorizonSide(mod(Int(side)+3,4))