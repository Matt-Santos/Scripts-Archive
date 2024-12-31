%[sig_out] = recons(U,S,p)
%
%reconstructs sub-space signal from its p lowest
%singular projections
%
%see also phase_space.m
%
%U,S	matrices from phase_space.m (SVD decomposition)
%p	order of reconstruction
%
%(c) Stephen J. Roberts, 1994

function [sig_out] = recons(U,S,p)

sig_out = zeros(size(U,1),1);

R=U*sqrt(S);
fill=zeros(size(U,2)-1,1);

for n=1:p
  sig_out = sig_out + R(:,n);
end;

sig_out = [sig_out; fill];

return;
