% Uses weights to generate output based on one input vector
% And with 1 hidden layer of 700 units
function [H1, output] = propogateInput(hiddenWeights, outputWeights, inputVector)
    hiddenInput = hiddenWeights*inputVector;
    H1 = activationFunction(hiddenInput);
    outputInput = outputWeights*H1;
    output = activationFunction(outputInput);
end