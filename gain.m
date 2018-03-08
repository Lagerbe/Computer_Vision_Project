function z=gain(x)
    M1=[-1 -1 -1 0 0 0 1 1 1];
    M2=[-1 0 1 -1 0 1 -1 0 1];
    m=length(x(:,1));
    k1=0;
    k2=0;
    for i=1:m;
        k1=k1+M1(i)*double(x(i,:));
        k2=k2+M2(i)*double(x(i,:));
    end
    z=sqrt(k1.^2+k2.^2);
end
    