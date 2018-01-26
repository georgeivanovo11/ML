%PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
%the decision boundary defined by theta

function plotDecisionBoundary(theta, X, y)

% Validation
if size(X, 2) ~= 3
    return;
end;

axisX_min = 30;
axisX_max = 100;
axisY_min = 30;
axisY_max = 100;

% Plot Data
plotData(X(:,2:3), y);
hold on;

% Plot Decision Boundary

% Only need 2 points to define a line:
leftPointX = axisX_min;
leftPointY = ( - theta(1) - theta(2)*leftPointX) / theta(3);

rightPointX = axisX_max;
rightPointY = ( - theta(1) - theta(2)*rightPointX) / theta(3);

plot_x = [leftPointX, rightPointX];
plot_y = [leftPointY, rightPointY];
plot(plot_x, plot_y);
    
legend('Admitted', 'Not admitted', 'Decision Boundary');
axis([axisX_min, axisX_max, axisY_min, axisY_max]);
hold off;
end;