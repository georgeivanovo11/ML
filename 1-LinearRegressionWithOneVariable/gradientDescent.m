%Finding out theta 

function [theta, J_history] = gradientDescent(X,y,theta,alpha,num_iters)
m = length(y);
J_history = zeros(num_iters, 1);
deltaTheta = zeros(2,1);

for iter = 1:num_iters,
	J_history(iter) = computeCost(X,y,theta);
	deltaTheta(1) = alpha * (1/m) * sum(X*theta-y);
	deltaTheta(2) = alpha * (1/m) * sum( (X*theta-y) .* X(:,2));
	theta = theta-deltaTheta;
end;
	
		
	