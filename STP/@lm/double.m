function result = double(obj)
% LM/DOUBLE    double converter for lm class

% $Id: double.m 13 2010-12-27 14:29:56Z hsqi $

[p, q] = size(obj);               
rows = obj.v(:);                  
cols = 1:q;                        
result = sparse(rows, cols, 1, p, q);  
