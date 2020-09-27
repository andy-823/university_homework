function great_painter(r::Robot)
    ist=false
    side=Ost
    num_ver=moves!(r,Sud)
    num_hor=moves!(r,Ost)
    putmarker!(r)
    count=first_row(r)
    num_hor+=count
    if isborder(r,Nord)==true
        ist=true
    else
        move!(r,Nord)
        num_ver+=1
    end
    while ist==false
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
        if count==0
            ist=true
        end
        if side==Ost
            side=West
        else
            side=Ost
        end
        if isborder(r,Nord)==true
            ist=true
        else
            move!(r,Nord)
            num_ver+=1
        end
    end
    if (num_ver<0)==true
        side=Nord
        num_ver*=-1
    else
        side=Sud
    end
    move_back(r,side,num_ver)
    if (num_hor<0)==true
        side=West
        num_hor*=-1
    else 
        side=Ost
    end
    move_back(r,side,num_hor)
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
    for _ in 1:num_steps
        move!(r,side)
    end
end