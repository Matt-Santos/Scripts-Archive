function [y, s, u, v] = embedfilt(x, I, D)
%  function [y, s, u] = embedfilt(x, I, D)
%
%  Filter the vector x by making a phase space embedding of it and then
%  projecting onto some singular vectors.
%
%  x        Vector to be filtered
%  I        Indices of the singular vectors onto which x is projected.
%           Default [1].
%  D        Dimension in which to embed.  Default 20.
%
%  y        Filtered x.
%  s        Singular values from embedding of x; X = u s v'
%  u        Singular vectors from embedding.
%  v        Singular vectors from embedding.

% $Id: embedfilt.m,v 1.2 1998/04/28 12:38:34 rme Exp $
if nargin < 2 | isempty(I), I = [1]; end
if nargin < 3 | isempty(D), D = 20; end

x=x(:);

% Pad
L = length(x);
d = floor((D-1)/2);
w = D - 1 -d;
xx = [x(1:d); x; x(L-w+1:L)];

[u, s, v] = svd(embed(xx, D, 1), 0);
s = diag(s);

% Project onto the sv
U = u(:,I);
c = U'*x;
y = sum(U*diag(c), 2);

return;
