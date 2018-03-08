function phase_Image=project_phase(Ix,Iy,n)
phase_Image=Iy./Ix;
    for  i=1:n(1)
        for j=1:n(2)
        if isnan(phase_Image(i,j))
         phase_Image(i,j)=0;
        end
        end
    end