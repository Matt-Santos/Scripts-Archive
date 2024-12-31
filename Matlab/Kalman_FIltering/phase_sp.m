%[U,S,V] = phase_space(x)
%
%Builds up an embedding matrix using Taken's method
%of delays.  This is then decomposed using singular
%value decomposition (SVD), such that X = USV^{T}
%
%[U,S,V] are output matrices
%x is an (N x 1) vector (time series)
%
%see also recons.m to reconstruct the signal from
%its decomposition
%
%(c) Stephen J. Roberts, 1994

function [U,S,V] = phase_space(x)

embedding_dim = 20;
lag = 1;
		% make embedding matrix, X
X = embed(x,embedding_dim,lag);
		% Now do a singular value decompostion
[U,S,V] = svd(X,0);

return;
