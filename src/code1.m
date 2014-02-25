il = imread('cones/im2.png');
ir = imread('cones/im6.png');
el = edge(rgb2gray(il), 'canny');
er = edge(rgb2gray(ir), 'canny');
% figure(1)
% imshow(el)
% figure(2)
% imshow(er)

[M, N] = size(el);

wsize = 3;

% img3 contains the disparities of the edge points
img3 = zeros(M,N);


for i=1+wsize:M-wsize,
    for j=1+wsize:N-wsize,
        if(el(i,j))
            disp([i j])
            correl = zeros(N,1);
            for k=j+1:floor(min(j+N/2,N-wsize-1)),
                kk = -wsize:wsize;
                correl(k) = corr2(el(i+kk,j+kk),er(i+kk,k+kk));
            end
            [maxval, ind] = findpeaks(correl);
            if (numel(ind)>0)
                img3(i,j) = ind(1)-j;
            else
                img3(i,j) = 1;
            end
%             disp([i j img3(i,j)])
        end
    end
end


% for i=1:375,
%     for j=1:450,
%         if(img3(i,j))
%             img3(i,j) = img3(i,j) - j;
%         end
%     end
% end

save('sparse-disparity.mat','img3');