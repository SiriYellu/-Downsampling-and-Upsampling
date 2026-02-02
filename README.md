# CS 7367 – Machine Vision  
## Assignment 1

**Instructor:** Dr. Sanghoon Lee  
**Student Name:** Yellu Siri  
**KSU ID:** 001165833  

---

## 1. Abstract

In this project, I explored basic image processing techniques focusing on **image resolution changes** and **gray level reduction**. The main goal was to manually implement these techniques using loops and conditional statements while avoiding built-in MATLAB functions, in order to understand the underlying processes step by step.

The first part of the project focused on resolution changes. Starting with a 1024×1024 image, I reduced its size to 512×512, 256×256, 128×128, 64×64, and 32×32 by averaging pixel blocks. These downsampled images were then upsampled back to 1024×1024 by repeating pixel values. This process highlighted the loss of detail during downsampling and the pixelated appearance introduced during upsampling.

In the second part, I reduced the number of gray levels in an 8-bit grayscale image (256 levels) to 128, 64, 32, 16, 8, 4, and 2 levels. This demonstrated how gray-level reduction simplifies an image while introducing visible intensity steps.

Overall, this project helped me understand how changes in resolution and gray levels affect the visual appearance of an image and provided a strong foundation in basic image processing concepts.

---

## 2. Test Results

### 2.1 Downsampling and Upsampling

**Input Image:** `rose.jpg`

#### Downsampled Images
- 32×32 pixels (Pixel skip rate: 32, Sampling factor: 32)
- 64×64 pixels (Pixel skip rate: 16, Sampling factor: 16)
- 128×128 pixels (Pixel skip rate: 8, Sampling factor: 8)
- 256×256 pixels (Pixel skip rate: 4, Sampling factor: 4)
- 512×512 pixels (Pixel skip rate: 2, Sampling factor: 2)

These images demonstrate the gradual loss of detail and sharpness as resolution decreases.

#### Upsampled Images
The downsampled images were restored to 1024×1024 using **nearest-neighbor interpolation**:

- Upsampled from 32×32 (Scaling ratio: 32)
- Upsampled from 64×64 (Scaling ratio: 16)
- Upsampled from 128×128 (Scaling ratio: 8)
- Upsampled from 256×256 (Scaling ratio: 4)
- Upsampled from 512×512 (Scaling ratio: 2)

The upsampled images appear pixelated, showing that lost details cannot be recovered.

---

## 2.2 Gray-Level Quantization

Gray-level reduction was applied to the grayscale image with the following levels:

- 2 Gray Levels (Step size: 128)
- 4 Gray Levels (Step size: 64)
- 8 Gray Levels (Step size: 32)
- 16 Gray Levels (Step size: 16)
- 32 Gray Levels (Step size: 8)
- 64 Gray Levels (Step size: 4)
- 128 Gray Levels (Step size: 2)

Reducing gray levels simplified the image but introduced noticeable banding and loss of smooth transitions.

---

## 3. Discussion

This project helped me better understand fundamental image processing concepts by implementing them manually rather than using MATLAB’s built-in functions. Downsampling illustrated how resolution impacts image detail, while upsampling demonstrated how pixel repetition leads to blurring and blockiness.

Gray-level reduction showed how simplifying intensity values can significantly alter the appearance of an image. One of the main challenges was ensuring accuracy while manually coding these operations, which improved my understanding of interpolation and intensity mapping.

In the future, I would like to explore more advanced interpolation techniques such as **bilinear** and **bicubic interpolation**, as well as apply these methods to color images. Overall, this project provided a strong foundation in image processing and highlighted the importance of balancing simplicity and detail in visual data manipulation.

---

## 4. Code

### 4.1 `resolution_changes.m`

```matlab
% resolution_changes.m
% Name: YELLU SIRI
% KSU ID: 001165833

clear all;
close all;
clc;

img = imread('rose.jpg');
if size(img,3) == 3
    img = manual_rgb2gray(img);
end

if size(img,1) ~= 1024 || size(img,2) ~= 1024
    img = manual_resize(img, 1024);
end

sizes = [512 256 128 64 32];
figure('Name', 'Resolution Changes');

for i = 1:length(sizes)
% gray_level_reduction.m
% Name: YELLU SIRI
% KSU ID: 001165833

clear all;
close all;
clc;

img = imread('rose.jpg');
if size(img,3) == 3
    img = manual_rgb2gray(img);
end

levels = [128 64 32 16 8 4 2];

for i = 1:length(levels)
    reduced = reduce_gray_levels(img, levels(i));
end
    down = downsample_image(img, sizes(i));
    up = upsample_image(down, 1024);
end
