# @param _input	Zeilen Vector e.g [1,2,3] for input neurons
# @return	cell-list of outputs for each neuron

function ret = feedForward(_NN, _input)
    #load sigmoid function and its derivative     
    source("../../Commons/sigmoid.m")

    #{
    if size(_NN{1})(1) != length(_input) + 1
        error("wrong input dimension");
    end
    #}
    
#	Matrizen der Reihe nach multiplizieren mit den inputvector.
#	Das Produkt wird zum neuen inputvector.    
    inputVector = _input;
#	add one for bias
    inputVector = [inputVector,1];
#	input in first place
    activations{1} = inputVector; 
    
#	init multiplication with input vector
    previousLayerOutput = inputVector;
    
#	iteration over layers    
    for i = 1:length(_NN)-1     
        Z = _NN{i} * previousLayerOutput';
        
#	    activation function
        previousLayerOutput = sigmoid(Z');
        
#	    add bias input for every HIDDEN layer, do not add bias for output layer     
        previousLayerOutput = [previousLayerOutput, 1];
#	    insert layer outputs in activations
        activations{i+1} = previousLayerOutput;  
    end
	
#	Last layer has linear output
    i = length(_NN);
    Z = _NN{i} * previousLayerOutput';
    previousLayerOutput = Z';
    activations{i+1} = previousLayerOutput;


    ret = activations;
end


