% load('DataFile.mat');

[M, N] = size(img3);

iters = 2000;
n_depth = img3;
depth = img3;
p=1;

for k = 1:iters,
    disp(k);
    for i = 1+p:M-p,
        for j = 1+p:N-p,
            if(er(i,j)==0)
%                 acc=0;
%                 for l=-p:p,
%                     for m=-p:p,
%                        acc = acc + n_depth(i+l,j+m) ;
%                     end
%                 end
%                 n_depth(i,j)= acc/(2*p+1)^2;
                n_depth(i,j) = (depth(i,j+1) + depth(i,j-1) + depth(i+1,j) + depth(i-1,j))/4;
            end
        end
    end
    depth = n_depth;
end

figure ;
imshow(mat2gray(n_depth));