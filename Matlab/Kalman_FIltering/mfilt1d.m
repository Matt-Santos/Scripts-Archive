%[sig_out] = mfilt1d(sig_in,p)
%
%Takes an input signal array (arbitrary dimensions) and applies
%median filtering.  Time axis is assumed to be the row (first)
%co-ordinate of the time series
% 
%sig_out	output signal (N x m) where N = sample number
%sig_in		input signal (N x m)
%p		order of filter (ODD order normally required)
%
%(c) Stephen J. Roberts, 1994

function [sig_out] = mfilt1d(sig_in,p)

[N,D] = size(sig_in);

p2 = (p-1)/2;		% half filter size
sig_out = zeros(N,D);	% output is same size as input

for n = 1 : N - p,
  x = sig_in(n:n+p-1,:);
  sig_out(n+p2,:) = median(x);
end; %

return;