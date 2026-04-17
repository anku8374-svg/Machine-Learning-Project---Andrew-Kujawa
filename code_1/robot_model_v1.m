%% ROBOT EXECUTION FAILURE CLASSIFIER (UCI DATASET)

clear; clc; close all;

%% 1. LOAD DATA
% Make sure this file is in the same folder
data = readtable('robot_lp1.csv');

%% 2. DEFINE FEATURES AND TARGET

% First column = class label
Y = data{:,1};

% Remaining columns = features (90 total)
X = data{:,2:end};

% Convert labels to categorical
Y = categorical(Y);

%% 3. TRAIN / TEST SPLIT (70/30)

cv = cvpartition(Y, 'HoldOut', 0.3);

X_train = X(training(cv), :);
Y_train = Y(training(cv));

X_test = X(test(cv), :);
Y_test = Y(test(cv));

%% 4. TRAIN RANDOM FOREST

numTrees = 100;

model = TreeBagger(numTrees, X_train, Y_train, ...
    'Method', 'classification', ...
    'OOBPrediction', 'on', ...
    'OOBPredictorImportance', 'on');

%% 5. MAKE PREDICTIONS

[Y_pred, scores] = predict(model, X_test);

% Convert predictions to categorical
Y_pred = categorical(Y_pred);

%% 6. CONFUSION MATRIX

figure;
confusionchart(Y_test, Y_pred);
title('Confusion Matrix - Robot Failures');

%% 7. ACCURACY

accuracy = sum(Y_pred == Y_test) / numel(Y_test);
disp(['Accuracy: ', num2str(accuracy)]);

%% 8. FEATURE IMPORTANCE

figure;
bar(model.OOBPermutedPredictorDeltaError);
title('Feature Importance');
xlabel('Feature Index');
ylabel('Importance');

%% 9. (OPTIONAL) LABEL FEATURE NAMES

featureNames = data.Properties.VariableNames(2:end);

figure;
bar(model.OOBPermutedPredictorDeltaError);
title('Feature Importance (Labeled)');
set(gca, 'XTickLabel', featureNames);
xtickangle(45);
ylabel('Importance');
