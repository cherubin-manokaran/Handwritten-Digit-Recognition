% Reads images from file
% Calls function to resize image using bilinear interpolation
function [images, names] = loadImagesFromFolder(folderPath)   
    folder = folderPath;
    if ~isdir(folder)
      errorMessage = sprintf('Error: The following folder does not exist:\n%s', folder);
      uiwait(warndlg(errorMessage));
      return;
    end

    filePattern = fullfile(folder, '*.png');
    pngFiles = dir(filePattern);
    files = {pngFiles.name};
    names = cell(length(files),1);
    images = (zeros(28,28,length(files)));
    
    % Stores all names of files
    % Accesses images in natural order
    % Resizes images to MNIST data dimensions
    for k = 1:length(files)
      fullFileName = fullfile(folder, files{k});
      [~,name,ext] = fileparts(fullFileName);
      names(k) = java.lang.String(name);
      filename = strcat(name, ext);
      fullFileName = fullfile(folder, filename);
      image = imread(fullFileName);
      output = bilinearInterpolation(image, [20 20]);
      
      measurements = regionprops(output,'basic');
      boundingBox = measurements(2).BoundingBox;
      centeredImage = imcrop(output, boundingBox);
      
      out = zeros(28);
%       dim1 = size(centeredImage, 1)+3;
%       dim2 = size(centeredImage, 2)+3;
%       out(4:dim1, 4:dim2) = centeredImage;
      out(1:size(centeredImage, 1),1:size(centeredImage,2)) = centeredImage;
      
      output = circshift(out, [4 4]);
      images(:,:,k) = output;
    end
    
    figure;
    imshow(image)
    title('Before Preprocessing')
    
    figure;
    imshow(output)
    title('After Preprocessing')

    images = reshape(images, size(images, 1) * size(images, 2), size(images,3));

    images = double(images) / 255;
end