# validate NN for given file. disply statistics about the performance
#
#	@param _nn	neural network created via createNN
#   @param _filePath 
#	@param _nrInput	number of input variables (columns) in data file 

function validate(_nn, _filePath = "../../../Datasets/Test/Regression/trainingData", _nrInput = 1)
#	fetch data and split it
    dataRaw = dlmread(_filePath, ",");
    inputData = dataRaw(:, 1:_nrInput);
    targetData = dataRaw(:, _nrInput+1:size(dataRaw)(2));

    predictions = predict(_nn, inputData);
    squared_errors = (targetData - predictions).^2;
    
    rmse = sqrt(mean(squared_errors));
    std_e = std(targetData - predictions);
    std_targets = std(targetData);
    RSquared = 1 - sum(squared_errors)/(var(squared_errors)*size(squared_errors)(1));
    r = cov(predictions, targetData)/(std(predictions)*std(targetData));
        
    printf("\n**************************\n");
    printf("Root Mean Squared Error: %.2f\n", rmse); 
    printf("Std Deviation of Error: %.2f\n", std_e);
    printf("Std Deviation of Targets: %.2f\n", std_targets);
    printf("R Squared: %.2f\n", RSquared);
    printf("Correlation of Coefficient: %.2f\n", r);  
    printf("**************************\n");

    plot(inputData', targetData', ".", inputData', predictions', ".");
    #plot(inputData', , markerstyle = ".");
end
    
    
