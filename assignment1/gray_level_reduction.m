% gray_level_reduction.m
% Name: YELLU SIRI
% KSU ID: 001165833

clear all;
close all;
clc;

% Read and preprocess image
img = imread('rose.jpg');
if size(img,3) == 3
    img = manual_rgb2gray(img);
end

% Ensure image is 1024x1024
if size(img,1) ~= 1024 || size(img,2) ~= 1024
    img = manual_resize(img, 1024);
end

% Gray level reduction
levels = [128 64 32 16 8 4 2];
figure('Name', 'Gray Level Reduction');

% Display original
subplot(2,4,1);
imshow(img);
title('Original (256 levels)');

% Reduce and display gray levels
for i = 1:length(levels)
    reduced = reduce_gray_levels(img, levels(i));
    subplot(2,4,i+1);
    imshow(reduced);
    title([num2str(levels(i)) ' levels']);
    imwrite(reduced, sprintf('gray_%d.jpg', levels(i)));
end

function gray = manual_rgb2gray(rgb)
    r = double(rgb(:,:,1));
    g = double(rgb(:,:,2));
    b = double(rgb(:,:,3));
    gray = uint8(0.299 * r + 0.587 * g + 0.114 * b);
end

function resized = manual_resize(img, new_size)
    [rows, cols] = size(img);
    resized = zeros(new_size, new_size, 'uint8');
    
    row_ratio = rows / new_size;
    col_ratio = cols / new_size;
    
    for i = 1:new_size
        for j = 1:new_size
            row = min(rows, round(i * row_ratio));
            col = min(cols, round(j * col_ratio));
            if row == 0; row = 1; end
            if col == 0; col = 1; end
            resized(i,j) = img(row,col);
        end
    end
end

function reduced = reduce_gray_levels(img, num_levels)
    max_val = 255;
    step = max_val / (num_levels - 1);
    reduced = uint8(round(double(img) / step) * step);
end