% Calculates error (targetVector - output)
% Adjusts wights based on error
function [hiddenWeights, outputWeights, dOutWeight, dHiddenWeight] = backPropogateError(learningRate, momentum, hiddenWeights, outputWeights, inputVector, targetVector, H1, output, prevdOutWeight, prevdHiddenWeight)
    outDelta = dActivationFunction(output).*(targetVector-output);
    hiddenDelta = dActivationFunction(H1).*(outputWeights'*outDelta); 
    
    dOutWeight = learningRate.*outDelta*H1';
    dHiddenWeight = learningRate.*hiddenDelta*inputVector';
    
    outputWeights = outputWeights + dOutWeight + momentum*prevdOutWeight;
    hiddenWeights = hiddenWeights + dHiddenWeight + momentum*prevdHiddenWeight;
end