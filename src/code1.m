il = imread('cones/im2.png');
ir = imread('cones/im6.png');
el = edge(rgb2gray(il), 'canny');
er = edge(rgb2gray(ir), 'canny');
figure(1)
imshow(el)
figure(2)
imshow(er)


