Cherubin Manokaran
cmanokaran@brandeis.edu
Fundamentals of Artificial Intelligence
Assignment 4
MNIST Recogntition

Implements the following functions:
activationFunction.m
assignIntegerOutput.m
backPropogateError.m
dActivationFunction.m
loadImages.m
loadLabels.m
loadTargetValues.m
loadFromFolder.m
bilinearInterpolation.m
propogateInput.m
writeToFile.m

The functions are further implemented in MNISTRecognition.m

A set of 60000 images of handwritten digits and their corresponding labels
are used to train this network. This is a three-layered network with a hidden
layer comprising 700 hidden units. The images all have 28x28 pixels.
The images are encoded in a 28x28x[Number of Images] Matrix. A randomly
generated 700x784 matrix is implemented to represent the 784 dimensions of
an image (28x28 pixels). In another matrix (10x700), randomly generated
output weights are assigned to the matrix. To train the network, in addition
to the imagest, the labels are encoded in a 10x60000 matrix. Based on the
label which is a number from 0-9, a one is assigned to the row index that
is one more than the number while a zero is assigned to the other rows in
that column. A random encoded image is selected and propogated through the
network using the randomly generated weight matrices and a logistic sigmoid
transform to produce an output vector. The corresponding, encoded label is
selected. The error is calculated and backpropogated through the network to
adjust the weight matrices and produce the desired output from the next image.
In additions using the calculated error and a squashing function, momentum
is factored in when adjusting the weight matrices, meaning the most recent
change in weight is factored in. 500 epochs, or conesecutive batches of 100
input images are used to train. 

After training, the network is tested using another set of 10000 images.
Images and labels are loaded in the same manner. Inputs are sequentially
propogated through the network. The ouptut is translated into a predicted
number and compared to the label. The total number of correctly classified
digits are recorded. The image file name and predicted digit are then
written to a text file.
