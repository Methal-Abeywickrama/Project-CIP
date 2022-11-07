# frozen_string_literal: true

require_relative 'Graph'

# Insert the relevant data points into the below array
# Make sure to insert an equal amount of points to both the x and y arrays

y_array = [5.9, 6.4, 6.8, 7.1, 7.7, 8.1] # (Change the values given here)
x_array = [0, 2, 4, 6, 8, 10]

# Then run the program
# The coordinates obtained represent the no of big squares and no of little squares along a given axis
# Eg :-  for 2.27  mark the coordinates 2 big squares and 2.7 little squares along the given axis

graph = Graph.new(x_array, y_array)
graph.print_coordinates

# After drawing the graph and obtaining the location of cutting points, insert the relevant points
# into the arrays given below in the format given below
# [[no_of_big_x_squares, no_of_small_squares], [no_of_big_squares, no_of_small_squares]]

cutting_point1 = [[3, 4], [6, 1]] # (Change the values given here)
cutting_point2 = [[17, 0], [24, 3]]

graph.point_insertion(cutting_point1, cutting_point2)
