%[sig_out] = facet(sig_in,p,k)
%
%removes outliers based on statistical properties
%evaluated via a flat facet (line) segment to 
%signal neighbourhood.
%
%sig_in	(N x 1)
%p	number of samples in facet (filter order - ODD)
%k	threshold for defining outlier, removal if 
%	> k*std away from facet
%
%(c) Stephen J. Roberts, 1994


function [sig_out] = facet(sig_in,p,k)

l = size(sig_in,1);
p2 = (p-1)/2;
n = [-p2 : 1 : p2];
sig_out = zeros(l,1);

for i = 1 : l - p-1,
  xm = sig_in(i+p2);
  xl = sig_in(i:i+p2-1);
  xr = sig_in(i+p-p2:i+p-1);
  xt = [xl' xr']';
  a =  (n*sig_in(i:i+p-1)) / (n*n');
  g = mean(xt);
  est = (a*n + g);
  var = est*sig_in(i:i+p-1) - (est(p2+1)-xm)^2;
  if (xm - g)^2 > k*k*var;
	sig_out(i+p2) = g;
  else
	sig_out(i+p2) = xm;
  end;	% if
end; % i loop
