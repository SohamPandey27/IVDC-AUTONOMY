# IVDC-AUTONOMY
Develop a computer vision pipeline that processes a given image of a lane
and produces a clear bitmap output where:
1. The area between the lanes is marked black.
2. The surrounding regions are marked white.
Additionally, the pipeline should include an optional step to isolate the
background and subtract it from the original image. This pre-processing
step aims to enhance the performance of downstream deep learning
models.
## STEP-1: READING and DISPLAYING OF AN IMAGE
An image can be read by using imread("Path of img") and can be stored in some variable say "original_img".  
The image can be displayed using imshow() function with variable(in which img is stored) determined inside the function.
## STEP-2: PREPROCESSING
### GRAYSCALE CONVERSION
The image needs to be converted into grayscale image using rgb2gray() function as grayscale image occupies 1/3rd of the size of the rgb image.
### APPLYING GAUSSIAN FILTER
The processed image needs to be smoothened so that a major portion noises can be removed and less edges are detected and unnecessary edges are ignored.  
Gaussian filter gives weight to pixels according to the distnce from the centre , closer the pixel to the centre more weight it gets.  
imgaussfilt() function is used for applying Gaussian filter.  
## STEP-3: SEGMENTATION
Divison of an image into its segments for some meaningful purpose.
### EDGE DETECTION
edge() function is used for detecting edges in an image which   
is used for detecting lines in an image and ultimately lane.
The edge detection method involves canny,sobel,prewitt,robers and many more.
## STEP-4: POST-PROCESSING
Involves the application of morphological functions like dilation and erode coupled which includes closing and opening morphological functions.
In "dilation" the brightest pixel in the sliding window is taken.
In "erosion" the darkest pixel in the window is taken. "Opening" morphological function ,it removes all small white patterns preserving the larger ones.
"Closing" morphological function ,it removes all small dark patterns preserving the larger ones.
imopen() and imclose() are the frequently used morphological functions.  
To use these functions a structuring elemnt needs to be declared usng strel("shape", dimension).  
## OTHER FUNCTIONS USED 
### HOUGH LINE TRANSFORMATION
It is used to detect lines using edges anf parameter space with pre determined parameters like theta rho 
```  
[H, theta, rho] = hough(edges);
 ```
 Then peak is calculated  with the help of given code 
 ```
 peaks = houghpeaks(H, 2); 
 ```
 here 2 represents that only 2 lines are to be selected
 Than after getting 2 lines they are traced and their parameters are extracted from the lines 
 ``` 
 lines = houghlines(edges, theta, rho, peaks);
```
In the end the start point and end point of both the the lines are extracted and line is plotted on the original image itself.
``` 
figure, imshow(original_img);
hold on;
for k = 1:length(lines)
    xy = [lines(k).point1; lines(k).point2];
    plot(xy(:,1), xy(:,2), 'LineWidth', 2);
end
```

