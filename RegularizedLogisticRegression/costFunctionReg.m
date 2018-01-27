%Compute cost and gradient for 
%logistic regression with regularization

function [J, grad] = costFunctionReg(theta, X, y, lambda)
	m = length(y);
	theta2 = theta(2:end); % theta without first-element
	grad = ones(size(theta));

	h = sigmoid (X * theta);
	J = (-1/m) * sum(y .* log(h) + (1-y) .* log(1-h)) + (lambda/(2*m)) * sum(theta2 .^ 2);
	
	grad(1) = (1/m) * (X'(1,:) * (h-y)); 
	grad(2:end) = (1/m) * ( X'(2:end,:) * (h-y) ) + (lambda/m) .* theta2; 

end;