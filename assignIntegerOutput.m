% Finds integer based on output data
% Assumes maximum value in data vector indicates digit
% Digit is index of maximul value minus one
function digit = assignIntegerOutput(data)
    [~, digit] = max(data);
    digit = digit - 1;
end