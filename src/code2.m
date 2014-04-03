% load('DataFile.mat');

[M, N] = size(img3);

iters = 1000;
n_depth = img3;
p=1;

for k = 1:iters,
    disp(k);
    for i = 1+p:M-p,
        for j = 1+p:N-p,
            if(mask(i,j)==0)
                acc=0;
                for l=-p:p,
                    for m=-p:p,
                       acc = acc + n_depth(i+l,j+m) ;
                    end
                end
                n_depth(i,j)= acc/(2*p+1)^2;
            end
        end
    end
end

figure ;
imshow(mat2gray(n_depth));