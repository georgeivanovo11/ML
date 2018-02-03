function y = drawPlot(J_history, alpha)
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');
name = sprintf('alpha: %0.2f', alpha);
title(name, 'fontsize',15);
