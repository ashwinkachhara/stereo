[M, N] = size(img3);

iters = 15;
img4 = img3;
temp = zeros(M,N);

for k = 1:iters,
    disp(k);
    
    for i = 2:M-1,
        for j = 2:N-1,
            if(mask(i,j)==1)
                temp(i,j) = img4(i,j)/2 + (img4(i,j-1)*mask(i,j-1) + img4(i-1,j)*mask(i-1,j) + img4(i+1,j)*mask(i+1,j) + img4(i,j+1)*mask(i,j+1))/(2*(mask(i,j-1)+mask(i-1,j)+mask(i+1,j)+mask(i,j+1)));
            end

        end
    end
    img4 = temp;
end