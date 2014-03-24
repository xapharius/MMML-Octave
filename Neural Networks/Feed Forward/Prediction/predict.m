# For given data run nn and predict results
# Return as a matrix (obs * output Vars)
#
#	@param _nn	neural network created via createNN, trained via trainNN
#   @param inputData matrix (obs * input Vars)

function ret = predict(_nn, inputData)
    ret = [];
#   go through each observation
    for i = 1:size(inputData)(1)
        observation = inputData(i, :);
        activations = feedForward(_nn, observation);
        ret = [ret; [activations{end}]];
    end
end
