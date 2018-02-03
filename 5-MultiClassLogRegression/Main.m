%Multi-class Classification using logistic regression
clear ; close all; clc;
disp("\nThe program starts here");

%---------Loading the data----------
load('data1.mat'); %training data stored in arrays X,y 
m = size(X,1); %number of training examples
n = size(X,2); %number of features (20*20=400 pixels)
num_labels = 10; %number of classes - 0,1,2 ... 9

%-------Visualization of the data---
rand_indices = randperm(m); %reshuffle indices
rand_selection = X(rand_indices(1:120),:);
%displayData(rand_selection)

%------------Learning-------------
lambda = 0.1;
all_theta = oneVsAll(X,y,num_labels,lambda);

%------------Prediction-----------
pred = predictOneVsAll(all_theta, X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);