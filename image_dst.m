
clear all;

%STEP 3 - Manage the DATA - image data store

%create image data store for testing data and its labels
imdsTest = imageDatastore('/Users/dariusghomashchian/Desktop/Darius Macbook Pro/university/4rth Year/Semester 2/Image Processing/ASSIGNMENT 2/TESTING');
load('Testing_labels.mat');
imdsTest.Labels = categorical(sort(labels)); clear labels;

%create image data store for training data and its labels
imdeTrain = imageDatastore('/Users/dariusghomashchian/Desktop/Darius Macbook Pro/university/4rth Year/Semester 2/Image Processing/ASSIGNMENT 2/TRAINING');
load('Training_labels.mat');
imdeTrain.Labels = categorical(sort(labels)); clear labels;

%STEP 4 - DATA Inspection

%sample first image in training data and save it to a file
data = readimage(imdeTrain, 1);
imwrite(data, 'train1_Darius.png');
%now create a montage of 100 random images from the training data
sample = datasample(imdeTrain.Files, 100);
mntg = montage(sample);
im_Montage = mntg.CData;
imwrite(im_Montage, 'train_montage_rand100_Darius.png');







