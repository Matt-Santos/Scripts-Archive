%[Y] = normalise(X,D)
% Y : normalised data set
% X : input data set
% D : data set providing normal stats

function [Y] = normalise(X,D)

c = diag(cov(D))';
m = mean(D);

X = X - ones(size(X,1),1)*m;	% removes mean
Y = X./(ones(size(X,1),1)*sqrt(c));	% unit variance

return;
