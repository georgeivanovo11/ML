function [theta, J_history] = gradientDescent(X,y,theta,alpha,num_iter)
n = size(theta,1); %number of features
m = size(X,1); %number of training examples
deltaTheta = zeros(n, 1);
J_history = zeros(num_iter,1);
for i = 1:num_iter
	J_history(i) = computeCost(X,y,theta);
	for j = 1:n
		s = sum((X*theta-y) .* X(:,j));
		deltaTheta(j)= alpha*(1/m)*s;
	end;
	theta = theta - deltaTheta;
end;

