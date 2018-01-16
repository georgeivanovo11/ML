%---------Loading data-------------
data = load('data1.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); % number of training examples

%---------Plotting data------------
plot(X, y, 'rx', 'MarkerSize', 5); % rx - red crosses
ylabel('Profit in $10,000s');
xlabel('Population of City in 10,000s');

%---------Finding theta---------------
X = [ones(m,1), X];
theta = zeros(2,1);
iterations = 1500;
alpha = 0.01; 
theta = gradientDescent(X,y,theta,alpha,iterations);

%---------Ploting hypothesis----------
hold on; 
plot(X(:,2), X*theta, '-')
legend('Training data', 'Linear regression')
hold off;

%---------Visualizing J(theta)--------
theta0 = linspace(-10,10,100);
theta1 = linspace(-1,4,100);
J_vals = zeros(length(theta0),length(theta1));

for i = 1:length(theta0)
	for j = 1:length(theta1)
		t = [theta0(i); theta1(j)];
		J_vals(i,j) = computeCost(X,y,t);
	end;
end;
J_vals = J_vals';

%--------Prediction-------------------
predict1 = [1, 3.5] * theta;
fprintf('Population = 35,000, profit = %f\n', predict1*10000);
predict2 = [1, 7] * theta;
fprintf('Population = 70,000, profit = %f\n', predict2*10000);


% Surface plot
figure;
surf(theta0, theta1, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% Contour plot
figure;
contour(theta0, theta1, J_vals, logspace(-2, 3, 20));
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);

