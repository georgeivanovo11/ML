%Plotting the data

function y = plotData(X,y)
pos = find(y==1); %indexes of positive elements 
neg = find(y==0); %indexes of negative elements

plot(X(pos, 1), X(pos, 2), 'g+');
hold on;
plot(X(neg, 1), X(neg, 2), 'rx');
xlabel('Exam 2 score');
ylabel('Exam 1 score');
legend('Admitted','Not admitted'); 
hold off;


