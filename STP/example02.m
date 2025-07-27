% This example is to show the usage of stp class.
% Many useful methods are overloaded for stp class, thus you can use stp object as double.s

x = [1 2 1 1; 
     2 3 1 2;
     3 2 1 0];
y = [1 -2;
     2 -1];

sx = sparse(x);
sy = sparse(y);

% Covert x and y to stp class
a = stp(sx)
b = stp(sy)

% mtimes method is overloaded by semi-tensor product for stp class
c0 = spn(sx,sy,sy)
c = a*b*b, class(c)

% Convert an stp object to double
c1 = double(c), class(c1)

% size method for stp class
size(c)

% length method for stp class
length(c)

% subsref method for stp class
c(1,:)

% subsasgn method for stp class
c(1,1) = 3
