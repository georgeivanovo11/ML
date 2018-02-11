%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in
%incoming connections and L_out outgoing connections

function W = initializeWeights(L_in, L_out)
epsilon = sqrt(6) / (sqrt(L_in)+sqrt(L_out));
W = rand(L_out, 1+L_in) * 2 * epsilon - epsilon; 
end

