# _input = Zeilen Vector e.g [1,2,3]
# ret = cell-list of outputs

function ret = feedForward(_NN, _input)
    #{
    if size(_NN{1})(1) != length(_input) + 1
        error("wrong input dimension");
    end
    #}
    # Matrizen der Reihe nach multiplizieren mit den inputvector. Das Produkt wird zum neuen inputvector.    
    inputVector = _input;
    inputVector = [inputVector,1];
    activations{1} = inputVector; 
    for i = 1:length(_NN)     
        Z = _NN{i} * inputVector';
        inputVector = sigmoid(Z');
        
        if i < length(_NN)
            inputVector = [inputVector, 1];
        end
        activations{i+1} = inputVector;  #bias output
    end
         
    ret = activations;
end


