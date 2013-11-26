# @param _parameterList	List of natural numbers, each referring to the number of neurons in the layer
#                  Numbers start from input layer.
#                  eg. [3, 2, 1] = 3 input neurons, 2 hidden neurons, 1 output neuron
#
# @return	The NN as a Cell List, where each cell is containing a weight matrix e.g. the weights between layers.
#                  Each Neuron has its weights on one row.
#
function ret = createNN(_parameterList)
    for i = 2:length(_parameterList)
#		Create weight matrix of size defined by parameters. Random initialized in [-1,1]
        layer = rand(_parameterList(i), _parameterList(i-1) + 1) * 2 - 1;
#		include matrix as a cell
        ret{i - 1} = layer;
    end
end