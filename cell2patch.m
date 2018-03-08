function patch=cell2patch(hogcell,size_Of_Patch,n)

for i=floor(size_Of_Patch/2):n(1)-floor(size_Of_Patch/2)
    for j=floor(size_Of_Patch/2):n(2)-floor(size_Of_Patch/2)
        if mod(size_Of_Patch,2)==0
            patch{i,j}=cell2mat(reshape(hogcell(i-floor(sqrt(size_Of_Patch)/2)+1:i+floor(sqrt(size_Of_Patch)/2),j-floor(sqrt(size_Of_Patch)/2)+1:j+floor(sqrt(size_Of_Patch)/2)),[1,size_Of_Patch]));
        else
            patch{i,j}=cell2mat(reshape(hogcell(i-floor(sqrt(size_Of_Patch)/2)+1:i+floor(sqrt(size_Of_Patch)/2)+1,j-floor(sqrt(size_Of_Patch)/2)+1:j+floor(sqrt(size_Of_Patch)/2)+1),[1,size_Of_Patch]));
        end
    end
end 