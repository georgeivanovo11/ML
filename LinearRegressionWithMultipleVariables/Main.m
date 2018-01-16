%% Machine Learning Online Class
%  Exercise 2: Linear regression with multiple variables

%-----Loading and preprocessing data-----
data = load('data2.txt');
X = data(:,1:2); y = data(:,3);
m = length(y);
[X, mu, sigma] = normalizeFeatures(X); 
X = [ones(m,1) X];

%-----------Gradient Descent-------------
theta = zeros(size(X,2),1);
num_iters = 200;

subplot(2,2,1);
alpha = 0.3;
[theta, J_history] = gradientDescent(X,y,theta,alpha,num_iters);
drawPlot(J_history,alpha);

subplot(2,2,2);
alpha = 0.1;
theta = theta*0;
[theta, J_history] = gradientDescent(X,y,theta,alpha,num_iters);
drawPlot(J_history,alpha);

subplot(2,2,3);
alpha = 0.03;
theta = theta*0;
[theta, J_history] = gradientDescent(X,y,theta,alpha,num_iters);
drawPlot(J_history,alpha);

subplot(2,2,4);
alpha = 0.01;
theta = theta*0;
[theta, J_history] = gradientDescent(X,y,theta,alpha,num_iters);
drawPlot(J_history,alpha);

%---------Load testing data--------------
newX = [1650,3];
for i = 1:size(newX,2)
	newX(:,i) = (newX(:,i) - mu(i))/sigma(i);
end;
newX = [ones(1,1) newX];

%-------Prediction with gradient--------
alpha = 0.03;
theta = theta*0;
[theta, J_history] = gradientDescent(X,y,theta,alpha,num_iters);
newPrice1 = newX * theta;
disp(sprintf('Prediction with gradient: %0.0f', newPrice1));

%------------Normal Equation-----------
theta = normalEqn(X,y);
newPrice2 = newX * theta;
disp(sprintf('Prediction with normal equation: %0.0f', newPrice2));



