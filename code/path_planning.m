%Example
%Input :-
%n = 10;for number of nodes
%Output :- 
%nodes =

%    1.0000   -0.5000   -0.5000    1.4142
%    2.0000   -0.2215   -0.0782    0.9246
%    3.0000   -0.1078    0.1555    0.6986
%    4.0000    0.4575    0.2922    0.2121
%    5.0000    0.4649    0.4595    0.0536
%    6.0000   -0.3424    0.1557    0.9100
%    7.0000    0.4706   -0.4643    0.9647
%    8.0000    0.4572    0.3491    0.1568
%    9.0000   -0.0146    0.4340    0.5188
%  10.0000    0.5000    0.5000         0

%edges =

%    1.0000    6.0000    0.6744
%    3.0000    9.0000    0.2937
%    4.0000    8.0000    0.0569
%    4.0000    5.0000    0.1674
%    4.0000   10.0000    0.2121
%    5.0000   10.0000    0.0536
%    5.0000    8.0000    0.1106
%    6.0000    3.0000    0.2346
%    6.0000    2.0000    0.2634
%    7.0000    4.0000    0.7566
%    7.0000    8.0000    0.8135
%    7.0000    5.0000    0.9238
%    8.0000   10.0000    0.1568
%   10.0000    3.0000    0.6986

%path =

%    1     6     3    10
%.csv files for nodes, edges and path are created which can then be used in CoppeliaSim 

global obstacle;
global nodes;
global n;
global edges;
obstacle = [0.0, 0.0, 0.2;
0.0, 0.1, 0.2;
0.3, 0.2, 0.2;
-0.3, -0.2, 0.2;
-0.1, -0.4, 0.2;
-0.2, 0.3, 0.2;
0.3, -0.3, 0.2;
0.1, 0.4, 0.2];
n=10;% number of nodes
nodes=rand(n,2);
nodes=nodes-0.5; % to sample nodes
for j = 1:1:n
    z=for_node_not_in_obstacle(nodes(j,1),nodes(j,2));% to change nodes which are within obstacles
    nodes(j,1)=j;
    nodes(j,2)=z(1);
    nodes(j,3)=z(2);
end
nodes(1,2)=-0.5; % to fix the first and last node
nodes(1,3)=-0.5;
nodes(n,2)=0.5;
nodes(n,3)=0.5;
for i = 1:1:n % heuristic cost calulation for each node
    nodes(i,4)=dist(nodes(i,2),nodes(i,3),nodes(n,2),nodes(n,3));
end
csvwrite('nodes.csv',nodes);  % nodes created


edges=[];
for i= 1:1:n
    node_on_focus = i;
    nbr=neighbor(node_on_focus);
    for ii=1:1:length(nbr)
        yn=intersection_check(nodes(node_on_focus,2),nodes(node_on_focus,3),nodes(nbr(ii),2),nodes(nbr(ii),3));%variable for edge and obstacle intersection check
        [x,y]=find(edges==nbr(ii));
        rr=0; % variable to check for repeated edges
        for iii=1:1:length(x)
          if edges(x(iii),1)==node_on_focus || edges(x(iii),2)==node_on_focus
            MMMM=1;
            rr=[rr MMMM];
          end
        end
        if yn==0 && sum(rr)==0
            MMM=[node_on_focus,nbr(ii)];
            edges=[edges;MMM];
        end
    end
end
for iiii=1:1:length(edges(:,1)) % calculating cost for edges
    edges(iiii,3)=dist(nodes(edges(iiii,1),2),nodes(edges(iiii,1),3),nodes(edges(iiii,2),2),nodes(edges(iiii,2),3));
end
csvwrite('edges.csv',edges);
path=A_star_for_PRM(nodes,edges);
csvwrite('path.csv',path);