ileft = imread('aloe/view0.png');
iright = imread('aloe/view1.png');
[m, n] = size(ileft);

% res = 200/m;
% 
% il = imresize(il,res);
% ir = imresize(ir,res);


% el = edge(lpfimg(il), 'canny');
% er = edge(lpfimg(ir), 'canny');
il = double(rgb2gray(ileft));
ir = double(rgb2gray(iright));

il = stereogram_left;
ir = stereogram_right;

el = edge(il, 'canny',0.01);
er = edge(ir, 'canny',0.01);

%el = meanfilt (double(el));
%er = meanfilt (double(er));
% figure(1)
% imshow(el)
% figure(2)
% imshow(er)

max_disparity = 80;

[M, N] = size(il);
wsize = 12;
win = -wsize:wsize;

img3 = zeros(M,N);
mask = zeros(M,N);


disp(['Dimensions : H =' num2str(M) ' | W =' num2str(N)])

for i=(1+wsize):(M-wsize),
    for j=(1+wsize):(N-wsize),
        if(er(i,j))
%             disp(['-- Coloumn: ' num2str(j)])
            
            A = ir(i+win,j+win)/sqrt(sum(sum( ir(i+win,j+win) .* ir(i+win,j+win) )));
            B = il(i+win,j+win)/sqrt(sum(sum( il(i+win,j+win) .* il(i+win,j+win) )));
            max = corr2(A,B);
            for k =(j+1):(N-wsize-1),
                B = il(i+win,k+win)/sqrt(sum(sum( il(i+win,k+win) .* il(i+win,k+win) )));
                correl = corr2(A,B);
                if(max < correl)
                    img3(i,j) = k-j;    
                    max = correl;
%                     disp(['--correl = ' num2str(correl) ' | (' num2str(i) ',' num2str(j) ')' ' | disparity = ' num2str(img3(i,j)) ])
%                     disp([i j img3(i,j) min])a
                end
            end
            
            mask(i,j) = 1;
            if(img3(i,j) > max_disparity)
               img3(i,j) = 0;
               er(i,j) = 0;
               mask(i,j) = 0;
            end
            
        else
            mask(i,j) = 0;
        end
    end
    disp(['Processing Row: ' num2str(i)])
end

save('DataFile.mat', 'mask', 'img3');
