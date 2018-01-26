%Logistic regression

%----------Loading data--------
data = load('data1.txt');
X = data(:, 1:2);
y = data(:, 3);
%plotData(X,y);


%------Preprocessing data-----
[m, n] = size(X);
X = [ones(m, 1) X];
theta = zeros(n + 1, 1);

%------------Learning---------
[cost,grad] = costFunction(theta, X,y);
fprintf('Cost function before learning:%f\n', cost);

options = optimset('GradObj', 'on', 'MaxIter', 400);
[theta, cost] = fminunc(@(t)(costFunction(t, X, y)), theta, options);
fprintf('Cost function after learning:%f\n' , cost);

fprintf('Theta:\n');
disp(theta);
plotDecisionBoundary(theta,X,y);

%------------Prediction--------
myExampleX = [1,45,85];
p = predict(theta,myExampleX);

p = predict(theta,X);
fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);

