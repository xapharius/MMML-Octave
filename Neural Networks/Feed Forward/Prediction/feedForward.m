# @param _input	Zeilen Vector e.g [1,2,3] for input neurons
# @return	cell-list of outputs for each neuron

function ret = feedForward(_NN, _input)
    #load sigmoid function and its derivative     
    source("../../Commons/sigmoid.m")
   
#	Matrizen der Reihe nach multiplizieren mit den inputvector.
#	Das Produkt wird zum neuen inputvector für die nächsten Layers.    
    
#   add to activations, without bias unit
    activations{1} = _input;
#	add one for bias
    currActivations = [_input, 1];
     
    
#	iteration over layers    
    for i = 1:length(_NN)     
#       [1, nrNeurons_in] * [nrNeurons_in, nrNeurons_out]
        currActivations = currActivations * _NN{i};
        
#	    activation function, if not last Layer
        if i != length(_NN)
            currActivations = sigmoid(currActivations);
        end
#	    insert layer outputs in activations
        activations{i+1} = currActivations;  
        
#	    add bias unit    
        currActivations = [currActivations, 1];

    end
    ret = activations;
end


