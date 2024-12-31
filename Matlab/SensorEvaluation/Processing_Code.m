


% Function to Unify size of all varriables in workspace
%Var = who('-file','StoredWorkspace.mat');
%for i=1:length(Var)
%    if length(eval(Var{i}))>1601
%        temp = eval(Var{i});
%        assignin('base',Var{i},temp(1:1601));
%        %eval(Var{i}) = temp(1:1601);
%    end
%end


%Calculate Complex Signals
S6_5V = S6_Z_PM5V.*cos(2*pi*S6_P_PM5V/360)+1i*S6_Z_PM5V.*sin(2*pi*S6_P_PM5V/360);
