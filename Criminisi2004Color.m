close all; clear; clc;

mex main.c

p_r=7;

I = im2double(imread('Obr6m.png'));

%s_r = ceil(sqrt(size(I,1)*0.02*size(I,2)*0.02))
s_r  = 10000;

%%parametry
alfa = 0.2;

C    = ones([size(I,1) size(I,2)]);

mask = double(1-((I(:,:,1) == 0 ) & ...
                ( I(:,:,2) == 1) & ...
                ( I(:,:,3) == 0)));

[nx,ny,nz] = size(I);

tic
Ir = main(nx,ny,nz,I(:),mask(:),C(:),p_r,s_r,alfa);
t = toc;

I = reshape(Ir,[nx,ny,nz]);

imwrite(I, ['wynik_' 'pr_' num2str(p_r) 'sr_' num2str(s_r) 'alfa_' num2str(alfa) 't_' num2str(t) '.png']);

figure
imshow(I)


