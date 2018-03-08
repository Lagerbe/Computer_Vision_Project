function hogcell=Hog_Final3(B,cellsize)

%% Initialization
%     For tests
%     B=imread('pos-542.pgm');
%     cellsize=10;
%     type_of_gradient = 'Prewitt';

    %%
    bin=[-180,-135,-90,-45,0,45,90,135,180];
    n=size(B); 
    B=sqrt(double(B));
    [i,bins]=size(bin); bins=bins-1;
    %% We compute the gain and phase of gradients 
%      gain_Image=colfilt(I,[3,3],'sliding',@gain);
%      phase_Image=colfilt(I,[3,3],'sliding',@phaseproject);
      Fx=[-1 0 1];
      Fy=Fx';
      Ix=imfilter(B,Fx,'replicate');
      Iy=imfilter(B,Fy,'replicate');
      gain_Image=sqrt(Ix.*Ix+Iy.*Iy);
      phase_Image=project_phase(Ix,Iy,n);
    %% Representation for cellsize = 3 It is not necessary
%     Votes=identifyvote(phase_Image,bin);   
%     [imagegradients,vote_gain]=Store_arrows3by3(gain_Image,Votes,n,bin);
    %% Extraction of the hystograms for cells of size : sizecells
    y=1;
    image_HoG=zeros(n(1),n(2));
    for i=1:cellsize:n(1)
            x=1;
            for j=1:cellsize:n(2)
                gaincell=gain_Image(i:i+cellsize-1,j:j+cellsize-1); % gain of each cell
                phasecell=phase_Image(i:i+cellsize-1,j:j+cellsize-1); % phase of each cell
                gaincell=gaincell/max(max(gaincell));  %normalization of gaincell
                histcell=zeros(1,bins); %histogram of every cells,contain bins colum 
                [Histcell,image_Cell]=hist_cell(phasecell,gaincell,cellsize,bin,bins);            %vote and get histcell
            hogcell{1,floor(n(2)/cellsize)*(x-1)+y}=Histcell;   % every cell contains grandient vote of 8 bin
            x=x+1;  % x,y is to count the hogcell
            image_HoG(i:i+cellsize-1,j:j+cellsize-1)=image_Cell;
            end
            y=y+1;
    end
   % imshow(image_HoG)
    
    hogcell=single(cell2mat(hogcell));
% end


