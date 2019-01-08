 %% Train Network

display('Images and labels are being loaded...')
inputValues = loadImages('train-images-idx3-ubyte');
[outputValues, targetValues] = loadTargetValues('train-labels-idx1-ubyte');

display('The network is being trained...')

trainingSet = length(inputValues(1,:));
inputDimensions = length(inputValues(:,1));
outputSize = length(targetValues(:,1));

hiddenUnits = 500;
learningRate = 0.2;
momentum = 0.2;

hiddenWeights = rand(hiddenUnits, inputDimensions);
hiddenWeights = hiddenWeights/length(hiddenWeights(1,:));
outputWeights = rand(outputSize, hiddenUnits);
outputWeights = outputWeights/length(outputWeights(1,:));

epochs = 1:500;
batch = 100;

output = zeros(10,1);
errorVec = zeros(size(epochs));

prevdOutWeight = 0;
prevdHiddenWeight = 0;

for i = 1:length(epochs)
    error = 0;
    for j = 1:batch
        n(batch*(i-1)+j) = floor(rand(1) * trainingSet + 1);
        inputVector = inputValues(:, n(batch*(i-1)+j));
        targetVector = targetValues(:, n(batch*(i-1)+j));

        [H1, output] = propogateInput(hiddenWeights, outputWeights, inputVector);

        [hiddenWeights, outputWeights, dOutWeight, dHiddenWeight] = backPropogateError(learningRate,...
            momentum, hiddenWeights, outputWeights, inputVector, targetVector, H1, ...
            output, prevdOutWeight, prevdHiddenWeight);

        prevdOutWeight = dOutWeight;
        prevdHiddenWeight = dHiddenWeight;

        error = error + norm(output - targetVector,2);
    end
    errorVec(i) = error/batch;
end
plot(epochs, errorVec,'x')
xlabel('Epoch')
ylabel('Error')

%% Test Network

display('Would you like to read image files from a folder?')
display('If not, the network will be tested using the MNIST test data set.')
display('That is if the MNIST test data file is in the same folder')
display('The network predicts MNIST test data with a 94% accuracy');
userInput1 = input('Please answer "yes" or "no". ','s');

if (strcmp(userInput1,'yes'))
    userInput2 = input('Please enter the complete path to the images folder. ','s');
    [testImages, names] = loadImagesFromFolder(userInput2);
else
    testImages = loadImages('t10k-images-idx3-ubyte');
    [testLabels, targetValues] = loadTargetValues('t10k-labels-idx1-ubyte');
end

display('Testing network...')

testSet = length(testImages(1,:));
inputDimensions = length(testImages(:,1));
outVec = zeros(10, testSet);

countCorrect = 0;
countIncorrect = 0;

for i = 1:testSet
    inputVector = testImages(:,i);
    [H1, output] = propogateInput(hiddenWeights, outputWeights, inputVector);
    outVec(:,i) = output;
    digit = assignIntegerOutput(output);
    
    if (strcmp(userInput1,'yes'))
        writeToFile(digit, names{i})
    else
        writeToFile(digit, i)
    end
    
    if (strcmp(userInput1,'no'))
        if (digit == testLabels(i))
            countCorrect = countCorrect + 1;
        else
            countIncorrect = countIncorrect + 1;
        end
    end
end

if (strcmp(userInput1,'no'))
    fprintf('Correctly Classified Images = %i\n', countCorrect)
    fprintf('Incorrectly Classified Images = %i\n\n', countIncorrect)
end

display('Predictions can be found in the following file: predictions.txt')
