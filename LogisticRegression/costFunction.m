%COSTFUNCTION Computes cost and gradient for logistic regression

function [J, grad] = costFunction(theta, X, y)
m = length(y); % number of training examples

h = sigmoid(X * theta);
J = (-1 / m) * sum(y .* log(h) + (1 - y) .* log(1-h));
grad = (X' * (h-y)) / m;
end;
