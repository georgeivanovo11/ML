%Regularized Logistic Regression

%Predict whether microchips from a fabrication plant 
%passes quality assurance - two tests.

%-------Loading data---------
data = load('data2.txt');
X = data(:, 1:2);
y = data(:, 3);
%plotData(X,y);


%------Preprocessing data-----
X = mapFeature(X(:,1), X(:,2), 6);
theta = zeros(size(X,2), 1);
lambda = 1;

%----------Learning-----------
[cost,grad] = costFunctionReg(theta,X,y,lambda);
options = optimset('GradObj','on','MaxIter',400);
[theta, cost] = fminunc(@(t) (costFunctionReg(t,X,y,lambda)), theta, options);
disp(cost);

plotDecisionBoundary(theta,X,y);

%---------Prediction----------
p = predict(theta,X);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

