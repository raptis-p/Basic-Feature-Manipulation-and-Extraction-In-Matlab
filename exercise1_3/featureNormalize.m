function [X_norm, mu, sigma] = featureNormalize(X)
%FEATURENORMALIZE Normalizes the features in X 
%   FEATURENORMALIZE(X) returns a normalized version of X where
%   the mean value of each feature is 0 and the standard deviation
%   is 1. This is often a good preprocessing step to do when
%   working with learning algorithms.

%% Initializing Variables
mu = zeros(1,size(X,2)); % mean of each column (feature)

sigma = zeros(1,size(X,2));% standart deviation of each column
X_norm = zeros(size(X)); % normalize each column independently


%% Setting correct values
for i=1:size(X,2)
    mu(i) = mean(X(:,i));
    sigma(i) = std(X(:,i));
    X_norm(:,i) = (X(:,i) - mu(i))/sigma(i);
end
% ============================================================

end
