% Writes image file name and digit to file
function writeToFile(digit, label)
    fName = strcat('predictions.txt');
    id = fopen(fName,'a+');
    
    if (id ~= -1)
        fprintf(id,'%s.png\t%i\n', label, digit);
        fclose(id);
    end
end