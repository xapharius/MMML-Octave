#
# @param _NN			NN from CreateNN
# @param _activations	activation matrices from feedForward
# @param _target		Array of target class per observation
# @param _learningRate	optional learning rate
# @return				NN with updated weights


function ret = backpropagation(_NN, _activations, _target, _learningRate = 0.5)
#	load sigmoid function and its derivative     
    source("sigmoid.m")
    
#	Using "delta rule" for backprop - http://de.wikipedia.org/wiki/Backpropagation

#	Compute first layer Deltas    
    delta{length(_NN)} = sigmoidDerivative(_activations{length(_activations)}) .* (_target .- _activations{length(_activations)});
    
#	Bottom-Up through all layers (from output to input neuron)  
    for i = length(_NN)-1:-1:1
#		Sum deltas * the weights - The sum is important if weight influences multiple parent neurons
        S = delta{i + 1} * _NN{i+1};
#		For each delta in new layer multiply with derivative - check formula
        delta{i} = sigmoidDerivative(_activations{i+1}) .* S;
#		Don't need the delta for the bias neuron -> remove the last delta
        delta{i} = delta{i}(1:length(delta{i})-1);
    end

# 	Update Weights - using the learning rate
    NN = _NN;    
    for i = 1:length(NN)
        deltaW = _learningRate * (delta{i}' * _activations{i});
        NN{i} = _NN{i} + deltaW;
    end  
    
    
    ret = NN;
end


