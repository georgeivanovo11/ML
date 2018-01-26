%Predict whether the label is 0 or 1

function p = predict(theta, X)
g = sigmoid(X * theta);
p = round(g);