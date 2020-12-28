The method for path planning is PRM

number of nodes considered = 50
The method used to find intersection between a potential edge(line segment) and an obstacle(circle) is by geometric in approach
The method - 1)one of the points of edge is connected to the center of the circlular obstacle
             2)taking the projection of this connected line on the edge
             3)caluculating the distance of the segment perpendicular to the edge and passing through the center of circle
             4)If this distance is less than the radius of the circle INTERSECTION occours
             5)One need to use an additional condition for this method to work which is "the length of the projection should be ...
               less than length of the edge

The code uses 5 functions as described below

1)dist
To calculate the distance between 2 points
method - distance formula

2)for_node_in_obstacle
To avoid sampling nodes which are within obstacles
method - calculating distance between the potential node and each obstacle

3)neighbor
To calculate 5 neighbors of a particular node
method - by calculating distance of the selected node with each other node

4)intersection_check
To calculate if a potential edge is intersecting with any of the obstacles
method - 1)one of the points of edge is connected to the center of the circlular obstacle
         2)taking the projection of this connected line on the edge
         3)caluculating the distance of the segment perpendicular to the edge and passing through the center of circle
         4)If this distance is less than the radius of the circle INTERSECTION occours
         5)One need to use an additional condition for this method to work which is "the length of the projection should be ...
           less than length of the edge

5)A_star_for_PRM
To find the path 

