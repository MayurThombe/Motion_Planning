function [path,success]=A_star_for_PRM(NN,EE)
global n;
%global edges;
%global path;
i = 1;
open = [1];
closed = [];
goal = n;
path = n;
%nodes=readmatrix('nodes.csv');
%edges=readmatrix('EDGES.csv');
nodes=NN;
edges=EE;
zzz=zeros(1,n-1)+1000;
zzzz=zeros(1,n)+1000;
past_cost=[0 zzz];
parent=zzzz;
est_total_cost=[1.4142 zzz];
while ~(isempty(open))
    if length(open) > 1 % delete first node in open
        open(1)=[];     
    end
    current = open(1);
    closed(length(closed)+1) = current;% add current to closed
    if current == goal
        success =1;
        fprintf('success');
       while goal ~= 1% generate an array for success path
       path(length(path)+1) = parent(goal);
       goal = parent(goal);
       end
       path=flip(path);
       %csvwrite('PATH.csv',path);
       return
    end
    j=1;
    nbr = [];
    while j<=length(edges(:,1))% find an array for nbrs of current
        if edges(j) == current
            nbr(length(nbr)+1) = edges(j,2);
        end
        j=j+1;
    end
    while j>=(length(edges(:,1))+1) && j<=(2*length(edges(:,1)))
        if edges(j) == current
            nbr(length(nbr)+1) = edges((j-length(edges(:,1))),1);
        end
        j=j+1;
    end
  a=1;% generate array of elements in nbr not present in closed
  nbrclosed=[];
  while a<=length(nbr)
      if sum(nbr(a) == closed)==0
          nbrclosed(length(nbrclosed)+1)=nbr(a);
      end
      a=a+1;
  end 
  for index = 1:length(nbrclosed)
      r=find((edges(:,1)==current&edges(:,2)==nbrclosed(index))|(edges(:,2)==current&edges(:,1)==nbrclosed(index)));
      tentative_past_cost = past_cost(current) + edges(r,3);
      if tentative_past_cost<past_cost(nbrclosed(index))
          past_cost(nbrclosed(index)) = tentative_past_cost;
          parent(nbrclosed(index)) = current;
          %to sort open
          est_total_cost(nbrclosed(index)) = past_cost(nbrclosed(index)) + nodes(nbrclosed(index),4);
          open(length(open)+1) = nbrclosed(index);
          AA=[est_total_cost(open);open];
          AA=AA';
          AA=sortrows(AA);
          open=AA(:,2);
          open=open';
      end
  end
end
end

  
          
            