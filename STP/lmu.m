function m = lmu(k)

% LMU    Produces dummy logical matrix, return an LM object
%
%   The dummy logical matrix M satisfies MXY = Y, where X, Y 
%   are two logical variables
%
%   M = LMU     for classical logic
%   M = LMU(K)  for k-valued logic
%
%   Example: m = lmu, m = lmu(2)

% $Id: lmu.m 9 2010-12-22 14:32:11Z hsqi $

if nargin == 0 | isempty(k)
	k = 2;
end

m = lm(repmat(1:k,1,k),k);
