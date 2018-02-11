%  PREDICT - outputs the predicted label of X given the
%  trained weights of a neural network (Theta1, Theta2)

function p = predict(Theta1, Theta2, X)
m = size(X, 1);
num_labels = size(Theta2, 1);
X = [ones(m,1) X];

z2 = X * Theta1';
a2 = sigmoid(z2);

a2 = [ones(m,1) a2];
z3 = a2 * Theta2';
a3 = sigmoid(z3);

[maxVal, maxInd] = max(a3,[],2);
p = maxInd;
