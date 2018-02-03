%PREDICT Predict the label for a trained one-vs-all classifier. The labels 
%are in the range 1..K, where K = size(all_theta, 1).

function p = predictOneVsAll(all_theta, X)
 
m = size(X, 1);
num_labels = size(all_theta, 1);
X = [ones(m, 1) X];

h = sigmoid(X * all_theta');
[maxVal, maxIndex] = max(h,[],2); %max elemet in each row
p  = maxIndex;


   







% =========================================================================


end
