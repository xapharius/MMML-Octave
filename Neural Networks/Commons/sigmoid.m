# Sigmoidal function
# (-inf, inf) -> (0,1)

function ret = sigmoid(_z)
    ret = 1 ./ (1 + exp(-_z));
end

function ret = sigmoidDerivative(_x)
    ret = _x .* (1 - _x);
end