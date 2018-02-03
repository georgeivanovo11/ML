%Normalizing features from -1 to 1

function [X_norm, mu, sigma] = normalizeFeatures(X)
X_norm = X;
mu = mean(X,1); % mean for each column
sigma = std(X,1); % standard deviation for each column
n = size(X,2); % number of features

for i = 1:n,
	X_norm(:,i) = (X(:,i) - mu(i))/sigma(i);
end;
