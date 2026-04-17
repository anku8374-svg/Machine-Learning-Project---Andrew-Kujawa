%% ROBOT EXECUTION FAILURE CLASSIFIER (TUNED MODEL - VERSION 2)

clear; clc; close all;

%% 1. LOAD DATA
data = readtable('robot_lp1.csv');

%% 2. DEFINE FEATURES AND TARGET

Y = data{:,1};
X = data{:,2:end};

Y = categorical(Y);

%% 3. TRAIN / TEST SPLIT (70/30)

cv = cvpartition(Y, 'HoldOut', 0.3);

X_train = X(training(cv), :);
Y_train = Y(training(cv));

X_test = X(test(cv), :);
Y_test = Y(test(cv));

%% 4. TRAIN RANDOM FOREST (TUNED)

numTrees = 300;  % Increased from 100

model = TreeBagger(numTrees, X_train, Y_train, ...
    'Method', 'classification', ...
    'MinLeafSize', 5, ...                 % NEW
    'NumPredictorsToSample', 10, ...      % NEW
    'OOBPrediction', 'on', ...
    'OOBPredictorImportance', 'on');

%% 5. MAKE PREDICTIONS

[Y_pred, scores] = predict(model, X_test);
Y_pred = categorical(Y_pred);

%% 6. CONFUSION MATRIX

figure;
confusionchart(Y_test, Y_pred);
title('Confusion Matrix - Tuned Model');

%% 7. ACCURACY

accuracy = sum(Y_pred == Y_test) / numel(Y_test);
disp(['Tuned Model Accuracy: ', num2str(accuracy)]);

%% 8. FEATURE IMPORTANCE

figure;
bar(model.OOBPermutedPredictorDeltaError);
title('Feature Importance (Tuned Model)');
xlabel('Feature Index');
ylabel('Importance');

%% 9. LABELED FEATURE IMPORTANCE

featureNames = data.Properties.VariableNames(2:end);

figure;
bar(model.OOBPermutedPredictorDeltaError);
title('Feature Importance (Labeled - Tuned)');
set(gca, 'XTickLabel', featureNames);
xtickangle(45);
ylabel('Importance');
