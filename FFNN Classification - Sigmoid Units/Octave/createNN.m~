# _parameterList = List of natural numbers, each refering to the number of neurons in the layer
#                  Numbers start from input layer.
#                  eg. 3 2 1 = 3 input neurons, 2 hidden neurons, 1 output neuron
#
#   ret          = Cell List, where each cell is containing a weight matrix eg. the weights between layers.
#                  Each Neuron has its weigths on one row.
#
function ret = createNN(_parameterList)
    for i = 2:length(_parameterList)
        layer = rand(_parameterList(i), _parameterList(i-1) + 1) * 2 - 1;
        ret{i - 1} = layer;
    end
end
