function [B] = lpfimg(A)
    Af = fft2(rgb2gray(A));
    [M, N] = size(rgb2gray(A));

    th = 1/16;
    Lpf = ones(M,N);
    disp(size(Lpf));
    for i = floor(M*th):floor(M*(1-th)),
        for j = 1: N,
            Lpf(i,j)=0;
        end
    end
    for i = 1:M,
        for j = floor(N*th): floor(3*(1-th)),
            Lpf(i,j)=0;
        end
    end
    disp(size(Af));
    disp(size(Lpf));
    
    B = floor(abs(ifft2(Af.*Lpf)));
    
end
