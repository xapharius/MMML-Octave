#
# @param _NN			NN from CreateNN
# @param _activations	activation matrices from feedForward
# @param _target		Array of target class per observation
# @param _learningRate	optional learning rate
# @return				NN with updated weights

# deltaRule{i}:    row vector
# activations{i}:  row vector 


function ret = backpropagation(_NN, _activations, _target, _learningRate = 0.5)
#	load sigmoid function and its derivative     
    source("../../Commons/sigmoid.m")
    
#	Using "delta rule" for backprop - http://de.wikipedia.org/wiki/Backpropagation

#	Compute output layer Deltas    
    deltaRule = {(_target .- _activations{end})};
#	Go Backwards thorugh layers (from output to imput)
    for i = length(_NN):-1:2 # dont need deltas for input layer!!!!!!
#       Deltas are always prepended, so deltaRule{1} is always the last inserted element
#		Sum deltas * the weights - The sum is important if weight influences multiple parent neurons
        sums = _NN{i} * deltaRule{1}';
#       remove bias activations since there are no weights from the previous layer to it
        sums = sums(1:end-1, :)';

#		For each delta in new layer multiply with derivative
        deltaRule_thisLayer = sigmoidDerivative(_activations{i}) .* sums;
        
#       Prepend delta 
        deltaRule = {deltaRule_thisLayer, deltaRule{:}};
    end
# 	Update Weights - using the learning rate
    NN = _NN;    
    for i = 1:length(NN)
#       Activations need the bias value here
        weightsChange = _learningRate .* ([_activations{i},1]' * deltaRule{i});
        NN{i} = _NN{i} + weightsChange;
    end  
     
    ret = NN;
end
