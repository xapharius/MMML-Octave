# _sampleSize   = Size of wanted training Set
# _func         = function out of which to sample       (ex call "generateTrainingData(@f1, 100)")
# _sampleRange  = distance between min value and max value (ex range 2 => original data between [-1,1])

function ret = generateTrainingData(_func, _sampleSize = 1000, _sampleRange = 4)

    # TODO: generate inputs in a series so that y-plot-only makes sense
    inputs = (rand(_sampleSize, 1)-0.5) * _sampleRange;
    targets = _func(inputs);
    
    #normalize inputs
    inputs = normalizePerCol(inputs);
    #normalize targets
    #targets = normalizePerCol(targets);

    #plot(inputs', targets', ".");

    data = [inputs, targets];
    dlmwrite("trainingData",data);  
end

function ret = normalizePerCol(_mat)
    ret = _mat;
    for i = 1:size(_mat)(2)
        ret(:,i) = _mat(:,i)/norm(_mat(:,i));
    end
end

