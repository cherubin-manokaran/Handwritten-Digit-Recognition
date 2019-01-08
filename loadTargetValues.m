% Loads all integer labels
% Creates 10x[Number of Labels] matrix
% Assigns 1 to appropriate row (1-10) in column of corresponding label
function [labels, targetValues] = loadTargetValues(filename)
    labels = loadLabels(filename);

    targetValues = zeros(10, length(labels));

    for n = 1: length(labels)
        targetValues(labels(n) + 1, n) = 1;
    end
end