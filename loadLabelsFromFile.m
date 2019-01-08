function labels = loadLabelsFromFile(filePath)
    fileID = fopen(filePath,'r');
    data = textscan(fileID,['%s' '%d'],'Delimiter',['\t' '\n']);
    
    [~, labels] = deal(data{:});
end