# _sampleSize   = Size of wanted training Set
# _func         = function out of which to sample       (ex call "generateTrainingData(100, @f1)")

function ret = generateTrainingData(_func, _sampleSize, _sampleRange)
    data = (rand(_sampleSize, 1)-0.5) * _sampleRange;
    data = [data, _func(data)];
    dlmwrite("trainingData",data);
end
