clear; clc;

% Open raw file
fid = fopen('lp1.data');

data = {};
labels = {};

while ~feof(fid)
    
    % Read class label
    line = strtrim(fgetl(fid));
    
    if isempty(line)
        continue;
    end
    
    labels{end+1,1} = line;
    
    sample = [];
    
    % Read 15 time steps
    for i = 1:15
        line = fgetl(fid);
        nums = str2num(line); %#ok<ST2NM>
        sample = [sample nums];
    end
    
    data{end+1,1} = sample;
end

fclose(fid);

% Convert to matrix
X = cell2mat(data);
Y = categorical(labels);

% Combine into table
T = array2table(X);
T = addvars(T, Y, 'Before', 1, 'NewVariableNames', 'class');

% Save as CSV
writetable(T, 'robot_lp1.csv');

disp('Conversion complete!');
