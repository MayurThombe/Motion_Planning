function yn=intersection_check(x1,y1,x2,y2)
doIntersect1 = 0;
doIntersect2 = 0;
doIntersect3 = 0;
doIntersect4 = 0;
doIntersect5 = 0;
doIntersect6 = 0;
doIntersect7 = 0;
doIntersect8 = 0;
P1 = [x1, y1];  % Point 1 of the line
P2 = [x2, y2];    % Point 2 of the line
C  = [0, 0];    % Center of circle
R  = 0.1;         % Radius of circle
P12 = P2 - P1;    %line P12
N   = P12 / norm(P12);  %unit vector for line P12
P1C = C - P1;           %Line from P1 to C
dotproduct=dot(P12,P1C)/norm(P12);   %magnitude of projection of P1C on P12
projectionrelative=dotproduct*N;    %to take the projection on line segment
projection=projectionrelative+P1;    %to find co-ordinates of projection wrt origin
CTL=sqrt((dist(P1(1),P1(2),C(1),C(2))^2)-(dist(P1(1),P1(2),projection(1),projection(2))^2));%center to line perpendicular distance
if CTL<R && dist(P1(1),P1(2),projection(1),projection(2))<(norm(P12)+R)   %if CTL<R && projection length <edge under consideration
doIntersect1 = 1;
end

C  = [0, 0.1];    
R  = 0.1;         
P12 = P2 - P1;
N   = P12 / norm(P12);  
P1C = C - P1;           
dotproduct=dot(P12,P1C)/norm(P12);
projectionrelative=(dotproduct*N);
projection=projectionrelative+P1;
CTL=sqrt((dist(P1(1),P1(2),C(1),C(2))^2)-(dist(P1(1),P1(2),projection(1),projection(2))^2));
if CTL<R && dist(P1(1),P1(2),projection(1),projection(2))<(norm(P12)+R)
doIntersect2 = 1;
end

C  = [0.3, 0.2];    
R  = 0.1;         
P12 = P2 - P1;
N   = P12 / norm(P12);  
P1C = C - P1;           
dotproduct=dot(P12,P1C)/norm(P12);
projectionrelative=(dotproduct*N);
projection=projectionrelative+P1;
CTL=sqrt((dist(P1(1),P1(2),C(1),C(2))^2)-(dist(P1(1),P1(2),projection(1),projection(2))^2));
if CTL<R && dist(P1(1),P1(2),projection(1),projection(2))<(norm(P12)+R)
doIntersect3 = 1;
end

C  = [-0.3,-0.2];    
R  = 0.1;         
P12 = P2 - P1;
N   = P12 / norm(P12);  
P1C = C - P1;           
dotproduct=dot(P12,P1C)/norm(P12);
projectionrelative=(dotproduct*N);
projection=projectionrelative+P1;
CTL=sqrt((dist(P1(1),P1(2),C(1),C(2))^2)-(dist(P1(1),P1(2),projection(1),projection(2))^2));
if CTL<R && dist(P1(1),P1(2),projection(1),projection(2))<(norm(P12)+R)
doIntersect4 = 1;
end

C  = [-0.1, -0.4];    
R  = 0.1;         
P12 = P2 - P1;
N   = P12 / norm(P12);  
P1C = C - P1;           
dotproduct=dot(P12,P1C)/norm(P12);
projectionrelative=(dotproduct*N);
projection=projectionrelative+P1;
CTL=sqrt((dist(P1(1),P1(2),C(1),C(2))^2)-(dist(P1(1),P1(2),projection(1),projection(2))^2));
if CTL<R && dist(P1(1),P1(2),projection(1),projection(2))<(norm(P12)+R)
doIntersect5 = 1;
end

C  = [-0.2,0.3];    
R  = 0.1;         
P12 = P2 - P1;
N   = P12 / norm(P12);  
P1C = C - P1;           
dotproduct=dot(P12,P1C)/norm(P12);
projectionrelative=(dotproduct*N);
projection=projectionrelative+P1;
CTL=sqrt((dist(P1(1),P1(2),C(1),C(2))^2)-(dist(P1(1),P1(2),projection(1),projection(2))^2));
if CTL<R && dist(P1(1),P1(2),projection(1),projection(2))<(norm(P12)+R)
doIntersect6 = 1;
end

C  = [0.3,-0.3];    
R  = 0.1;         
P12 = P2 - P1;
N   = P12 / norm(P12);  
P1C = C - P1;           
dotproduct=dot(P12,P1C)/norm(P12);
projectionrelative=(dotproduct*N);
projection=projectionrelative+P1;
CTL=sqrt((dist(P1(1),P1(2),C(1),C(2))^2)-(dist(P1(1),P1(2),projection(1),projection(2))^2));
if CTL<R && dist(P1(1),P1(2),projection(1),projection(2))<(norm(P12)+R)
doIntersect7 = 1;
end

C  = [0.1,0.4];    
R  = 0.1;         
P12 = P2 - P1;
N   = P12 / norm(P12);  
P1C = C - P1;           
dotproduct=dot(P12,P1C)/norm(P12);
projectionrelative=(dotproduct*N);
projection=projectionrelative+P1;
CTL=sqrt((dist(P1(1),P1(2),C(1),C(2))^2)-(dist(P1(1),P1(2),projection(1),projection(2))^2));
if CTL<R && dist(P1(1),P1(2),projection(1),projection(2))<(norm(P12)+R)
doIntersect8 = 1;
end

yn=doIntersect1|doIntersect2|doIntersect3|doIntersect4|doIntersect5|doIntersect6|doIntersect7|doIntersect8;
end