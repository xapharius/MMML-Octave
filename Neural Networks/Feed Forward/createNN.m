# @param _parameterList	List of natural numbers, each referring to the number of neurons in the layer
#                  Numbers start from input layer.
#                  eg. [3, 2, 1] = 3 input neurons, 2 hidden neurons, 1 output neuron
#
# @return	The NN as a Cell List, where each cell is containing a weight matrix e.g. the weights between layers.
#           Shape = Input+1(bias) * Output
#
#
function ret = createNN(_parameterList)
    for i = 1:length(_parameterList)-1
#		Create weight matrix of size defined by parameters. Random initialized in [-0.5,0.5]
        layer = (rand(_parameterList(i) + 1, _parameterList(i+1)) - 0.5);
#		include matrix as a cell
        ret{i} = layer;
    end
end
