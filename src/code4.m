M = 200;
N = 200; 

stereogram_right = rand(M,N);

stereogram_right = round(stereogram_right);

m=80;
n=80;
xi = 91;
yi = 101;
disparity = 10;
stereogram_left = stereogram_right;

stereogram_left(xi:xi+m-1, (yi+disparity):(yi+disparity+n-1)) = stereogram_right(xi:xi+m-1, yi:yi+n-1);

replacement_block = rand(m,disparity);
replacement_block = round(replacement_block);
        
stereogram_left(xi:xi+m-1, yi:yi+disparity-1) = replacement_block;