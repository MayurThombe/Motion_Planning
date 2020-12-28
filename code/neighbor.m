function nbr=neighbor(node_on_focus)
global nodes;
global n;
B=[];
for i = 1:1:n
    M = dist(nodes(node_on_focus,2),nodes(node_on_focus,3),nodes(i,2),nodes(i,3));
    N=[node_on_focus i M];
    B=[B;N];
end
B(:,3)=B(:,3)*1000;
B=abs(B);
B=sortrows(B,3);
nbr = [B(2,2) B(3,2) B(4,2) B(5,2) B(6,2)];% here the size of nbr =3 as we want to consider 3 neighbors
end
