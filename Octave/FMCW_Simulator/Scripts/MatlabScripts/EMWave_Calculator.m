% Custom Interactive EM Wave Interphace Calculator
% Written by Matthew Santos
% ****************************************

function EMWaveCalculator()
    f = figure('Visible','off');
    % Create Controls
    ax = axes('Position',[0.1,0.40,0.85,0.55],'Box','on');
    ax.XLabel.String = 'Distance [m]';
    ax.YLabel.String = 'Electric Field Intensity [Wb/m^2]';
    ax.Title.String = 'EM Wave Calculator';
    panel = uipanel('Position',[0.05,0.05,0.9,0.25]);
    
    f.Visible = 'on';
end

