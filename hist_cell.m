function [Hist,image_Cell]=hist_cell(phasecell,gaincell,cellsize,bin,bins)
Hist=zeros(1,bins); %bins is size bin
angl=phasecell*180/pi;  %¡¡get angle  
for x=1:cellsize
       for y=1:cellsize
           if angl(x,y)<-180
                   angl(x,y)=angl(x,y)+360;
           end
           if angl(x,y)>360
                   angl(x,y)=angl(x,y)-360;
           end
           % because sometimes we got negitive number more than -180
           % and positive more than 180
            angl(x,y)=round(angl(x,y));
            if angl(x,y)>=bin(1) && angl(x,y)<=bin(2)-22
                a=1;
             elseif  angl(x,y)>=bin(2)-22 && angl(x,y)<bin(3)-22
                 a=2;
               elseif  angl(x,y)>=bin(3)-22 && angl(x,y)<bin(4)-22
                    a=3;
                 elseif  angl(x,y)>=bin(4)-22 && angl(x,y)<bin(5)-22
                      a=4;
                   elseif  angl(x,y)>=bin(5)-22 && angl(x,y)<bin(6)-22
                        a=5;
                     elseif angl(x,y)>=bin(6)-22 && angl(x,y)<bin(7)-22
                            a=6;
                       elseif angl(x,y)>=bin(7)-22 && angl(x,y)<bin(8)-22
                              a=7;
                         elseif angl(x,y)>=bin(8)-22 && angl(x,y)<bin(9)-22
                                 a=8;
                              else
                                a=1;
            end
            %classify the angle
            Hist(1,a)=gaincell(x,a)+Hist(1,a);
%             Hist=Hist(ceil(angl/45))+gaincell(x,y);
%               Hist(ceil(4*angl(x,y)/pi))=Hist(ceil(4*angl/pi))+gaincell(x,y); 
         %  histogram of grandient of every cell put in cell hogcell
       end
end
%% Part that give the plot of the hystogram
Hist=Hist/sum(Hist);
image_Cell=plot_The_Hystogram(Hist,cellsize);

end