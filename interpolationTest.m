image = imread('C:\Users\Manokaran\Documents\examples\194.png');
tmp = imresize(image, [28 28]);
output = bilinearInterpolation(image, [28 28]);

figure;
imshow(output)

tmp2 = imresize(image,[28 28],'bilinear');
tmp3 = imresize(image,[28 28],'bicubic');

figure;
imshow(image)

figure;
imshow(tmp)

figure;
imshow(tmp2)

figure;
imshow(tmp3)