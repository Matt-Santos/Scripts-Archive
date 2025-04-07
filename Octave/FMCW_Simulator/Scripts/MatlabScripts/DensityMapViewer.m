% Custom Interactive 3D Density Map Viewer
% Written by Matthew Santos
% ****************************************

function DensityMapViewer(DensityMap,X,Y,Z)
    f = figure('Visible','off');
    % Create Controls
    sldx = uicontrol('Style', 'slider',...
        'Min',X(1,1,1),'Max',X(1,size(X,2),1),'Value',0,...
        'SliderStep',[1/size(X,2) 10/size(X,2)],...
        'Units','normalized',...
        'Position', [0.15 0.15 0.80 0.05],...
        'Callback', @XChange);
    butx= uicontrol('Style','pushbutton',...
        'Units','normalized',...
        'Position',[0.05 0.15 0.1 0.05],...
        'String','X-Axis',...
        'Callback', @XView);
    sldy = uicontrol('Style', 'slider',...
        'Min',Y(1,1,1),'Max',Y(size(Y,1),1,1),'Value',0,...
        'SliderStep',[1/size(Y,1) 10/size(Y,1)],...
        'Units','normalized',...
        'Position', [0.15 0.1 0.80 0.05],...
        'Callback', @YChange);
    butx= uicontrol('Style','pushbutton',...
        'Units','normalized',...
        'Position',[0.05 0.10 0.1 0.05],...
        'String','Y-Axis',...
        'Callback', @YView);
    sldz = uicontrol('Style', 'slider',...
        'Min',Z(1,1,1),'Max',Z(1,1,size(Z,3)),'Value',0,...
        'SliderStep',[1/size(Z,3) 10/size(Z,3)],...
        'Units','normalized',...
        'Position', [0.15 0.05 0.80 0.05],...
        'Callback', @ZChange);
    butz= uicontrol('Style','pushbutton',...
        'Units','normalized',...
        'Position',[0.05 0.05 0.1 0.05],...
        'String','Z-Axis',...
        'Callback', @ZView);
    cord = uicontrol('Style','popupmenu',...
        'Units','normalized',...
        'Position',[0.05 0.95 0.2 0.05],...
        'String',{'Cartisian','Cylindrical','Polar'},...
        'Callback', @CordSet);
    % Setup and Plot Default View
    ax = axes('Position',[0.1,0.3,0.9,0.6]);
    ax.Title.String = 'Density Map Viewer';
    ax.XLabel.String = 'X [m]';
    ax.YLabel.String = 'Y [m]';
    ax.ZLabel.String = 'Z [m]';
    contourslice(X,Y,Z,DensityMap,0,[],[]);
    contourslice(X,Y,Z,DensityMap,[],0,[]);
    contourslice(X,Y,Z,DensityMap,[],[],0);
    colorbar('vert');
    view(3);
    f.Visible = 'on';
    
    function XChange(source,callbackdata)
        val=source.Value;
        cla;
        contourslice(X,Y,Z,DensityMap,source.Value,[],[]);
    end
    function YChange(source,callbackdata)
        val=source.Value;
        cla;
        contourslice(X,Y,Z,DensityMap,[],source.Value,[]);
    end
    function ZChange(source,callbackdata)
        val=source.Value;
        cla;
        contourslice(X,Y,Z,DensityMap,[],[],source.Value);
    end
    function XView(source,callbackdata)
        cla;
        if cord.Value == 1
            for i=1:size(X,2)
                contourslice(X,Y,Z,DensityMap,X(1,i,1),[],[]);
            end
        elseif cord.Value == 2
            [Xi,Yi] = cylinder;
            for i=1:length(X) %use largest length as r limit
                contourslice(X,Y,Z,DensityMap,Xi,Yi,[]);
            end
        elseif cord.Value == 3
                
        end
    end
    function YView(source,callbackdata)
        cla;
        for i=1:size(Y,1)
            contourslice(X,Y,Z,DensityMap,[],Y(i,1,1),[]);
        end
    end
    function ZView(source,callbackdata)
        cla;
        for i=1:size(Z,3)
            contourslice(X,Y,Z,DensityMap,[],[],Z(1,1,i));
        end
    end
    function CordSet(source,callbackdata)
        cla;
        if source.Value == 1
            butx.String = 'X-Axis';
            buty.String = 'Y-Axis';
            butz.String = 'Z-Axis';
            contourslice(X,Y,Z,DensityMap,0,[],[]);
            contourslice(X,Y,Z,DensityMap,[],0,[]);
            contourslice(X,Y,Z,DensityMap,[],[],0);
        elseif source.Value == 2
            butx.String = 'Radius';
            buty.String = 'Theta';
            butz.String = 'Z-Axis';
            [Xi,Yi,Zi] = cylinder;
            contourslice(X,Y,Z,DensityMap,Xi,Yi,Zi);
            %contourslice(X,Y,Z,DensityMap,[],Yi,[]);
            %contourslice(X,Y,Z,DensityMap,[],[],Zi);
        elseif source.Value == 3
            butx.String = 'Radius';
            buty.String = 'Theta';
            butz.String = 'Phi';
            [Xi,Yi,Zi] = sphere;
            contourslice(X,Y,Z,DensityMap,Xi,Yi,Zi);
        end
    end
end

