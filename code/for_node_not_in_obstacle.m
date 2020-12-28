
function A=for_node_not_in_obstacle(x,y)
%obstacle = [0.0, 0.0, 0.2;
%0.0, 0.1, 0.2;
%0.3, 0.2, 0.2;
%-0.3, -0.2, 0.2;
%-0.1, -0.4, 0.2;
%-0.2, 0.3, 0.2;
%0.3, -0.3, 0.2;
%0.1, 0.4, 0.2];
global obstacle;
a=dist(x,y,obstacle(1,1),obstacle(1,2))<=((obstacle(1,3)/2)+0.01);% 0.01 assumed to be radius of robot
b=dist(x,y,obstacle(2,1),obstacle(2,2))<=((obstacle(2,3)/2)+0.01);
c=dist(x,y,obstacle(3,1),obstacle(3,2))<=((obstacle(3,3)/2)+0.01);
d=dist(x,y,obstacle(4,1),obstacle(4,2))<=((obstacle(4,3)/2)+0.01);
e=dist(x,y,obstacle(5,1),obstacle(5,2))<=((obstacle(5,3)/2)+0.01);
f=dist(x,y,obstacle(6,1),obstacle(6,2))<=((obstacle(6,3)/2)+0.01);
g=dist(x,y,obstacle(7,1),obstacle(7,2))<=((obstacle(7,3)/2)+0.01);
h=dist(x,y,obstacle(8,1),obstacle(8,2))<=((obstacle(8,3)/2)+0.01);
i=a|b|c|d|e|f|g|h;
while i==1
    A=rand(1,2);
    A = A -0.5;
    x=A(1);
    y=A(2);
    a=dist(x,y,obstacle(1,1),obstacle(1,2))<=((obstacle(1,3)/2)+0.01);
    b=dist(x,y,obstacle(2,1),obstacle(2,2))<=((obstacle(2,3)/2)+0.01);
    c=dist(x,y,obstacle(3,1),obstacle(3,2))<=((obstacle(3,3)/2)+0.01);
    d=dist(x,y,obstacle(4,1),obstacle(4,2))<=((obstacle(4,3)/2)+0.01);
    e=dist(x,y,obstacle(5,1),obstacle(5,2))<=((obstacle(5,3)/2)+0.01);
    f=dist(x,y,obstacle(6,1),obstacle(6,2))<=((obstacle(6,3)/2)+0.01);
    g=dist(x,y,obstacle(7,1),obstacle(7,2))<=((obstacle(7,3)/2)+0.01);
    h=dist(x,y,obstacle(8,1),obstacle(8,2))<=((obstacle(8,3)/2)+0.01);
    i=a|b|c|d|e|f|g|h;
end
A=[x,y];
end