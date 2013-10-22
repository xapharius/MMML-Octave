# returns trained NN

function ret = trainNN(_NN, _filePath, _nrInput)
    dataRaw = dlmread(_filePath, ",");
    inputData = dataRaw(:, 1:_nrInput);
    targetData = dataRaw(:, _nrInput+1:size(dataRaw)(2));
    NN = _NN;
    for i = 1:size(inputData)(1)
        activations = feedForward(NN, inputData(i,:));
        NN = backpropagation(NN, activations, targetData(i,:));
        
        #{
        x = 0:0.001:1;
        y = NN{1}(1)/NN{1}(2)*x + NN{1}(1);
        clf("reset");
        hold on;  
        plot(x,y);
        hold off;
        drawnow; 
        pause(0.001);
        
        i*100/size(inputData)(1)
        #}
    end
    ret = NN;
end
