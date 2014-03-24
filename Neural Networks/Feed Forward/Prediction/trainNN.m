# returns trained NN
#
#	@param _NN	neural network created via createNN
#   @param _filePath 
#	@param _nrInput	number of input variables (columns) in data file 
#	@param _plotConvergance	plots the convergance in each iteration over the training data

function ret = trainNN(_NN, _filePath = "../../../Datasets/Test/Regression/trainingData", _nrInput = 1, _plotConvergence = false)
#	fetch data and split it
    dataRaw = dlmread(_filePath, ",");
    inputData = dataRaw(:, 1:_nrInput);
    targetData = dataRaw(:, _nrInput+1:size(dataRaw)(2));
    
    NN = _NN;
#	iterate over dataset, learn on each transaction - Online Learning
    for i = 1:size(inputData)(1)
#		get prediction for observation = pass observation through
        activations = feedForward(NN, inputData(i,:));
#		propagate errors back through network
        NN = backpropagation(NN, activations, targetData(i,:));
       
#		plot how NN converges   
		if (_plotConvergence)     
	        x = 0:0.001:1;
	        y = NN{1}(1)/NN{1}(2)*x + NN{1}(1);
	        clf("reset");
	        hold on;  
	        plot(x,y);
	        hold off;
	        drawnow; 
	        pause(0.001);
	        
#        	progress in percent
        	i*100/size(inputData)(1)
        end
    end
    ret = NN;
end
