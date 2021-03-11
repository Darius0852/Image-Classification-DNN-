# Image-Classification-DNN-
Deep Neural Network for Image Classification with the fashion MNIST dataset. 


Introduction

Deep learning is a subset of Artificial Intelligence (A.I.) which uses artificial neural networks (ANN), a concept inspired from the structure and function of the human brain to learn. Learning can be supervised, semi-supervised or unsupervised. Deep learning differs from other types of machine learning with large neural nets which are becoming increasingly accessible through technological advances in graphics cards and faster computer processing speeds. As such, Deep Learning has been out-performing older learning algorithms as they utilize scaling in both size of neural networks and size of training data resulting in their performance continuously increasing. 
Deep Learning is especially useful for image processing techniques, as the large scale of features involved in processing of images needs to be output and calculated with matrices, a technique which is aided by parallel processing used in deep learning. 



Objective

The objective of this project is to a) implement a deep artificial neural network, b) train this network using labelled training data and c) perform classification on the testing data. 
The data used for training and testing is the FashionMNIST dataset which comprises of 10 different labelling classifications, of which an associated image repository of 400 testing images and 2000 training images will be used.

Method

The first step is to generate labelled training and testing data. This was done by downloading the ‘FashionMNIST’ data folder and generating an image data store to compactly store all the images with relevant labels. The pre-processing stage requires labels to be sorted alongside corresponding images, this way their index numbers will match up and an image data store can be used to hold this collection of image/label files. 

 ![image](https://github.com/Darius0852/Image-Classification-DNN-/blob/main/report%20images/Picture%201.png)
Figure 1 – code snippet showing the initial setup of training/testing data.

Figure 1 shows how a categorical sort was used to sort labels in the ‘imdtr’ and ‘imdte’ datastores based on their respective index categories. 

As part of inspecting the data, a montage of 10x10 random images as a 28x28 image was created form the dataset, seen in Figure 1 lines 11-16 which created the following image. 

 ![image](https://github.com/Darius0852/Image-Classification-DNN-/blob/main/report%20images/Picture%202.png)
Figure 2 – 10x10 montage of random images from dataset.

Building the neural net required an input layer as the image input layer, a fully connected output layer with dimension set to 10 (the number of classes) so that the image can ultimately be classified. This output layer was followed by ‘sofmax’ and ‘classification’ layers. The ‘sofmax’ layer applies the unit activation function to its input to give a probability distribution of the list of classes. The classification layer takes this distribution and determines which class the input image represents. Intermediate layers, of which some of them were not essential, were used to inference features in the model. Figure 3 below shows the code used to set up the neural network architecture. 

 ![image](https://github.com/Darius0852/Image-Classification-DNN-/blob/main/report%20images/Picture%203.png)
Figure 3 – Code snippet neural network architecture in MATLAB.

Intermediate layers consisted of a number of layers, activation functions and pooling layers. One input layer was the ‘convolutional2dlayer’ which performs sliding convolutional filters to the input; moving filters vertically and horizontally across the input to compute a dot product of the weights with the input and adding a bias term. The ‘maxPooling2dLayer’ was necessary to down-sample the matrix by calculating the maximum of each region (Figure 4). 
 ![image](https://github.com/Darius0852/Image-Classification-DNN-/blob/main/report%20images/Picture%204.png)
Figure 4 – Max-Pooling layer with stride length 2, performed on a 4x4 matrix.
Setting the stride selects the increments by which the operation moves over the matrix while the poolsize describes the area of matrix which is being examined. ‘Relu’ layers are Rectified Linear Units which impose the ReLu linear function to filter out negative and non-linear weights. It acts as an activation function between nodes. 
The optional dropout layers were added which randomly set input layers to 0 at a given probability (set to 0.5 in this case) which helps combat overfitting in the model by disrupting analysis of unintended features in the images. 

Before running the neural network, the training and testing data is then split into training and validation data (Figure 5). 

 ![image](https://github.com/Darius0852/Image-Classification-DNN-/blob/main/report%20images/Picture%205.png)
Figure 5 – Code snippet showing the data being split into training and validation data before being run on the model.

The training used 80% of the ‘imdsTrain’ datastore, while the remaining 20% was used for validation. Using validation data is different from using novel image data as the labels from the validation data are known and can thus compare the output class from the neural network with the actual class and give a validation accuracy of the model. 


Results

A validation accuracy of 79.20% was reached in the training progress with a learning rate of 0.019.
 ![image](https://github.com/Darius0852/Image-Classification-DNN-/blob/main/report%20images/Picture%206.png)
Figure 6 – Chart of training progress output after running model.

 ![image](https://github.com/Darius0852/Image-Classification-DNN-/blob/main/report%20images/Picture%207.png)
Figure 7 – Confusion matrix output from labels and initial prediction.


Discussion

As the number of maximum epochs was set to a fixed value 15 for this project, limitations were set on the validation accuracy of the model. This is because increasing epochs past 15 increased accuracy up until the point at which the model begins to overfit – inferencing features of images which are either noise or not relevant to the image classification. Given this limitation the only real influence on model accuracy was the learning rate. Learning rate was increased to account for this limitation and a value between 0.019 and 0.02 was found through iteratively testing the model to have optimal influence on the validation accuracy. 

