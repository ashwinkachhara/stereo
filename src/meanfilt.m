function  [B] = meanfilt (A)

    [M, N] = size(A);
    B = A;
    for i = 2:M-1,
        for j = 2:N-1,
            B(i,j) = ( A(i+1,j)+A(i+1,j-1)+A(i+1,j+1) +A(i,j)+A(i,j-1)+A(i,j+1) + A(i-1,j-1)+A(i-1,j)+A(i-1,j+1))/3;
        end
    end



end