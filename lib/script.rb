# frozen_string_literal: true

require_relative 'Graph'

# Insert the relevant data points into the below array
# Make sure to insert an equal amount of points to both the x and y arrays

y_array = [8.8, 12.5, 13.8, 18.7, 20.3] # (Change the values given here)
x_array = [11, 16.1, 17.6, 22.4, 25]
 
# Then run the program
# The coordinates obtained represent the no of big squares and no of little squares along a given axis
# Eg :-  for 2.27  mark the coordinates 2 big squares and 2.7 little squares along the given axis

graph = Graph.new(x_array, y_array)
graph.print_coordinates

# After drawing the graph and obtaining the location of cutting points, insert the relevant points
# into the arrays given below in the format given below
# [[no_of_big_x_squares, no_of_small_squares], [no_of_big_squares, no_of_small_squares]]

cutting_point1 = [[0, 0], [0, 0]] # (Change the values given here)
cutting_point2 = [[0, 0], [0, 0]]

# Run the program again

graph.point_insertion(cutting_point1, cutting_point2)
