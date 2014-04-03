il = imread('teddy/im2.png');
ir = imread('teddy/im6.png');
el = edge(lpfimg(il), 'canny');
er = edge(lpfimg(ir), 'canny');

%el = meanfilt (double(el));
%er = meanfilt (double(er));
% figure(1)
% imshow(el)
% figure(2)
% imshow(er)

[M, N] = size(el);

wsize = 9;

img3 = zeros(M,N);
mask = zeros(M,N);

max_disparity = 100;

for i=1+wsize:M-wsize,
    for j=1+wsize:N-wsize,
        if(el(i,j))
%             disp([i j])
            
            correl = zeros(N,1);
            for k=j+1:min(floor(min(j+N/2,N-wsize-1)),j+round(max_disparity)),
                kk = -wsize:wsize;
                correl(k-j) = (1+3/(k-j))*corr2(el(i+kk,j+kk),er(i+kk,k+kk));
            end
            
%             [maxval, ind] = findpeaks(correl);
            [maxval, indmax] = max(correl);
            
            if (numel(indmax)>0  )%&& maxval(1) > correl(1))
                mask(i,j) = 1;
                img3(i,j) = indmax;
            else
                img3(i,j) = 0;
                mask(i,j) = 0;
            end
%             disp([i j img3(i,j)])
        else
            mask(i,j) = 0;
        end
    end
    disp(i)
end

save('DataFile.mat', 'mask', 'img3');
