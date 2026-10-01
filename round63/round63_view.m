function round63_view(X,ser,varargin)
% Create a figure that compares E-series tolerances with ROUND63 bin edges.
%
% (c) 2014-2025 Stephen Cobeldick
%
% Creates a figure to illustrate how ROUND63's rounding bin edges match
% the component tolerances, depending on the selected rounding method.
%
%%% Syntax %%%
%
%   round63_view(X,ser)
%   round63_view(X,ser,rnd)
%
%% Examples %%
%
%   >> round63_view(pi,'E12')
%
%   >> round63_view(3:7,'E6') % default = 'harmonic'
%   >> round63_view(3:7,'E6','up')
%   >> round63_view(3:7,'E6','down')
%   >> round63_view(3:7,'E6','arithmetic')
%
%% Input Arguments %%
%
%   X   = NumericArray, positive real values to be rounded and plotted.
%   ser = StringScalar or CharVector, to select the E-Series. See ROUND63 for a full list.
%
%% Dependencies %%
%
% * MATLAB R2009b or later.
% * round63.m <www.mathworks.com/matlabcentral/fileexchange/48840>
%
% See also ROUND63 ROUND63_TEST NUM2CIRCUIT NUM2SIP NUM2RKM ROUND HISTC HISTCOUNTS
persistent fgh axh
%
% Get PNS and edge values:
[~,idx,pns,edg,rnd] = round63(X,ser,varargin{:});
%
assert(numel(edg)>1,'SC:round63_view:InsufficientEdgeNumber',...
	'The provided input values do not define sufficiently many bin edges.')
%
% Estimate the component tolerance:
raw = sscanf(ser,'%*[eE]%f');
coe = 10.^ceil(log10(raw));
tol = round(10.^(round(3*log10(coe./raw))/3))./coe; % round to [1,2,5] PNS.
%
% Re-use figure or create new figure:
if ishghandle(fgh)
	cla(axh);
else
	fgh = figure('NumberTitle','off','Name','ROUND63 Demonstration',...
		'HandleVisibility','callback','MenuBar','figure', 'Toolbar','none');
	axh = axes('Parent',fgh);
	hold(axh,'on')
end
%
map = get(axh,'ColorOrder');
assert(size(map,1)>=4,'SC:round63_view:InsufficientColorOrder',...
    'The axes ColorOrder must contain four or more colors.')
%
% Plot edges, PNS values, and tolerances:
idy = 1:numel(pns);
idz = [0,1+idy(end)];
ln1 = plot(axh,       [edg(:),edg(:);nan(1,2)],      idz, '-', 'Color',map(1,:));
ln2 = plot(axh,                            pns,      idy, 'd', 'Color',map(2,:));
ln3 = plot(axh,[1-tol;1+tol]*reshape(pns,1,[]),[idy;idy],'o-', 'Color',map(3,:));
ln4 = plot(axh,                           X(:),   idx(:), '*', 'Color',map(4,:));
%
% Add labels and legend:
set(axh, 'YLim',idz, 'YTick',idy, 'YTickLabel',pns)
xlabel(axh,'Input Value')
ylabel(axh,sprintf('Output %s Value',upper(ser)))
legend(axh,[ln4(1),ln1(1),ln2(1),ln3(1)],...
	'Input value',sprintf('Bin edges (%s)',lower(rnd)),...
	'Nominal component value',...
	sprintf('Component tolerance (%.9g%%)',100*tol),...
    'Location','SouthEast')
title(axh,'Component Tolerance and Bin Edges')
%
drawnow()
%
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%round63_view