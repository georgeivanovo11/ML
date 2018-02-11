%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification

%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification

function [J grad] = nnCostFunction(nn_params, ...
                                   a1_size, ...
                                   a2_size, ...
                                   a3_size, ...
                                   X, y, lambda)

%%--Preparation
Theta1 = reshape(nn_params(1:a2_size * (a1_size + 1)), ...
                 a2_size, (a1_size + 1));

Theta2 = reshape(nn_params((1 + (a2_size * (a1_size + 1))):end), ...
                 a3_size, (a2_size + 1));

m = size(X, 1);
J = 0;

a1 = [ones(m,1) X];
Y=[];
for i = 1:a3_size
    Y = [Y y==i];
end;

%%--Cost function with Regularization
z2 = a1*Theta1';
a2 = sigmoid(z2);
a2 = [ones(m,1) a2];
z3 = a2*Theta2';
a3 = sigmoid(z3);
costOfExamples = sum(Y .* log(a3) + (1-Y) .* log(1-a3),2);
generalCost = (-1/m)*sum(costOfExamples,1);

Theta1_NoBias = Theta1(:,2:end); %no bias
Theta2_NoBias = Theta2(:,2:end); %no bias
reg1 = sum (sum(Theta1_NoBias .^ 2 , 2), 1);
reg2 = sum (sum(Theta2_NoBias .^ 2 , 2), 1);
regularization = (lambda/(2*m)) * (reg1 + reg2);

J = generalCost + regularization;

%%--Backpropagation
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

for t = 1:m %loop throught training examples
    %feedforward
    z2 = a1(t,:)*Theta1';
    a2 = sigmoid(z2);
    a2 = [1 a2];
    z3 = a2*Theta2';
    a3 = sigmoid(z3);
    %computing delta
    delta3 = (a3 - Y(t,:))';
    delta2 = Theta2_NoBias' * delta3 .* sigmoidGradient(z2)';
    %compute gradient
    Theta1_grad += delta2 * a1(t,:);
    Theta2_grad += delta3 * a2; 
end;

Theta1_grad /= m;
Theta2_grad /= m;

Theta1_grad(:,2:end) += (lambda/m) * Theta1_NoBias;
Theta2_grad(:,2:end) += (lambda/m) * Theta2_NoBias;

grad = [Theta1_grad(:) ; Theta2_grad(:)];

end;