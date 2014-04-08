[M, N] = size(img3);

iters = 1000;
img4 = img3;

mask1 = er;
mask2 = er;

for k = 1:iters,
    disp(k);
    flag = 0;
%     figure;
%     imshow(mat2gray(mask1));
    for i = 2:M-1,
        for j = 2:N-1,
            if(mask1(i,j)==0)
                flag = 1;
                if(mask1(i+1,j)==1)
                    img4(i,j) = img4(i+1,j);
                    mask2(i,j) = 1;
                elseif(mask1(i,j+1)==1)
                    img4(i,j) = img4(i,j+1);
                    mask2(i,j) = 1;
                elseif(mask1(i-1,j)==1)
                    img4(i,j) = img4(i-1,j);
                    mask2(i,j)=1;
                elseif(mask1(i,j-1)==1)
                    img4(i,j) = img4(i,j-1);
                    mask2(i,j)=1;
                end
            end

        end
    end
    mask1 = mask2;
    if(flag==0)
        break
    end
end