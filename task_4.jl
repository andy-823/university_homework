function great_painter(r::Robot)
    side=Ost
    num_ver=moves!(r,Sud)
    num_hor=moves!(r,Ost)
    putmarker!(r)
    count=first_row(r)
    num_hor+=count
    while (count>0)==true
        if isborder(r,Nord)==true
            count=1
        else
            move!(r,Nord)
            num_ver+=1
        end
        putmarker!(r)
        count-=1
        for _ in 1:count
            move!(r,side)
            putmarker!(r)
            if side==Ost
                num_hor-=1
            else
                num_hor+=1
            end
        end
        if isborder(r,West)==false
            move!(r,West)
            num_hor+=1
        end
        side=inverse(side)
    end
    move_back(r,Sud,num_ver)
    move_back(r,Ost,num_hor)
end

function moves!(r::Robot,side::HorizonSide)
    num_steps=0
    while isborder(r,side)==false
        move!(r,side)
        num_steps+=-1
    end
    return num_steps
end

function first_row(r::Robot)
    max=0
    while isborder(r,West)==false
        move!(r,West)
        putmarker!(r)
        max+=1
    end
    return max
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