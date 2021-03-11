%STEP 5 - Indicative Neural Network Architechture
rng('default');

%input layer
layers = [
%inputlayer
inputLayer = imageInputLayer([28 28 1])

%Intermediate Layers
convolution2dLayer(5, 64, 'Padding', 'same')
batchNormalizationLayer
reluLayer

maxPooling2dLayer(2, 'Stride', 2)
dropoutLayer(0.5)

convolution2dLayer(5, 64, 'Padding', 'same')
batchNormalizationLayer
reluLayer

maxPooling2dLayer(2, 'Stride', 2)
dropoutLayer(0.5)

fullyConnectedLayer(1024)
reluLayer
dropoutLayer(0.5)

fullyConnectedLayer(512)
reluLayer
dropoutLayer(0.5)

fullyConnectedLayer(128)
reluLayer

%outputLayers
fullyConnectedLayer(9)
softmaxLayer
classificationLayer]

%split the data
imdsValidation = s;

[imdsTrain, imdsValidation] = splitEachLabel(imdsTrain, 0.8);


%Training - options
options = trainingOptions('sgdm', ...
    'InitialLearnRate', 0.002, ...
    'MaxEpochs', 15, ...
    'Shuffle', 'once', ...
    'MiniBatchSize', 64, ...
    'ValudationData', imdsValidation, ...
    'ValidationFrequency', 10, ...
    'Verbose', false, ...
    'ExecutionEnvironment', 'cpu', ...
    'Plots', 'training-progress',);

%Training the neural net
net = trainNetwork(imdsTrain, layers, options);

YPred = predict(net, imdsTest);
[val, ind] = max(YPred, [], 2);
Pred = categorical(ind-1);

C = confusionmat(imdsTest.Labels, Pred);
f3 = figure(3);
confusionchart(C);
saveas(f3, 'Confusion_chart_Darius.png')









