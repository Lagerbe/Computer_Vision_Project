function image_Cell=plot_The_Hystogram(Hist,cellsize)
image_Cell=zeros(cellsize);
for i=1:8    
    if or(i==1,i==5)
        if mod(cellsize,2)~=0
            A=[zeros(floor(cellsize/2),cellsize);
                Hist(1,i).*ones(1,cellsize);
                zeros(floor(cellsize/2),cellsize)];
        else
            A=[zeros(cellsize/2-1,cellsize);
                Hist(1,i).*ones(1,cellsize);
                zeros(cellsize/2,cellsize)];
        end
    elseif or(i==2,i==6)
        B=Hist(1,i).*eye(cellsize);
        A=eye(cellsize);
        for j=1:cellsize
            A(:,j)=B(:,cellsize-j+1);
        end
    elseif or(i==3,i==7)
        if mod(cellsize,2)~=0
            A=[zeros(cellsize,floor(cellsize/2)),Hist(1,i).*ones(cellsize,1),zeros(cellsize,floor(cellsize/2))];
        else
            A=[zeros(cellsize,cellsize/2-1),Hist(1,i).*ones(cellsize,1),zeros(cellsize,cellsize/2)];
        end
    elseif  or(i==4,i==8)
        A=Hist(1,i).*eye(cellsize);
    end
    image_Cell=image_Cell+A;
end
  