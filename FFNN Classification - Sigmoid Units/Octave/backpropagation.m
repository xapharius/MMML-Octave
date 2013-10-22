function ret = backpropagation(_NN, _activations, _target, _learningRate = 0.5)
    
    #Compute first layer Deltas    
    delta{length(_NN)} = ableitung(_activations{length(_activations)}) .* (_target .- _activations{length(_activations)});
    #bottom up through all layers (from output to input neuron)  
    for i = length(_NN)-1:-1:1
        S = delta{i + 1} * _NN{i+1};
        #Dont need delta for bias neuron so cut the last delta
        delta{i} = ableitung(_activations{i+1}) .* S;
        delta{i} = delta{i}(1:length(delta{i})-1);
    end

# Change Weights
    NN = _NN;    
    for i = 1:length(NN)
        deltaW = _learningRate * (delta{i}' * _activations{i});
        NN{i} = _NN{i} + deltaW;
    end  
    ret = NN;
end

function ret = ableitung(_x)
    ret = _x .* (1 - _x);
end
