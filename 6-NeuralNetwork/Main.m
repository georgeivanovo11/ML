%% Neural Networks

%-------Initialization------------
clear ; close all; clc;
disp("The program starts here");

input_layer_size  = 400;  % 20x20 Input Images of Digits
hidden_layer_size = 25;   % 25 hidden units
num_labels = 10;  %10 labels, from 1 to 10  

%---------Loading data------------
load('data1.mat');
m = size(X, 1);

%-------Visualization of data---
rand_indices = randperm(m); %reshuffle indices
rand_selection = X(rand_indices(1:100),:);
%displayData(rand_selection);

%-------Testing cost function---------
load('weights.mat');
%nn_params = [Theta1(:) ; Theta2(:)];
%lambda = 0;
%J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
%disp(J);
%lambda = 1;
%J = nnCostFunction(nn_params, input_layer_size, hidden_layer_size, num_labels, X, y, lambda);
%disp(J);

%-------------Learning-------------
Theta1 = initializeWeights(input_layer_size, hidden_layer_size);
Theta2 = initializeWeights(hidden_layer_size, num_labels);
nn_params = [Theta1(:) ; Theta2(:)];
lambda=1;
%checkNNGradients(lambda);

options = optimset('MaxIter', 50);
costFunction = @(p) nnCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, X, y, lambda);
[nn_params, cost] = fmincg(costFunction, nn_params, options);

Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

%---------Prediction------------
pred = predict(Theta1,Theta2,X);
fprintf('\nTraining Set Accuracy: %f\n', mean(double(pred == y)) * 100);
