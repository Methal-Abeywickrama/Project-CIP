# frozen_string_literal: true

class Graph
  attr_accessor :x_array, :y_array, :formatted_coordinates

  def initialize(x_array, y_array)
    @x_array = x_array
    @y_array = y_array
    @formatted_coordinates = find_coordinates
    @point1 = nil
    @point2 = nil
    @gradient = nil
  end

  def find_coordinates
    return if @x_array.length != @y_array.length

    xlength2 = @x_array[-1] - @x_array[0]
    ylength2 = @y_array[-1] - @y_array[0]
    xmin = @x_array[0]
    ymin = @y_array[0]
    new_x_array = @x_array.map { |x| ((x - xmin) * 90 / xlength2 ) }
    new_y_array = @y_array.map { |y| ((y - ymin) * 130 /ylength2 ) }

    format_coordinates(new_x_array, new_y_array)
    # print_coordinates(format_coordinates(new_x_array, new_y_array))
  end

  def format_coordinates(new_x_array, new_y_array)
    new_array = []
    new_x_array.each_with_index do |x, i|
      x_coordinate = x.divmod(5)
      x_coordinate = "#{x_coordinate[0]}.#{(x_coordinate[1] * 10).floor}"
      y_coordinate = new_y_array[i].divmod(5)
      y_coordinate = "#{y_coordinate[0]}.#{(y_coordinate[1] * 10).floor}"
      new_array.push([x_coordinate, y_coordinate])
    end
    new_array
  end

  def print_coordinates
    @formatted_coordinates.each_with_index do |x, i|
      print "Coordinate #{i + 1} X=(#{x[0]}) Y=(#{x[1]}) (No: of squares) \n"
    end
  end

  def point_insertion(point_1, point_2)
    calculate_points_and_gradient(point_1, point_2)
    print_summary
  end

  def print_summary
    puts 'The critical points are ...'
    puts "Coordinate A (#{@point1[0]}, #{@point2[1]})"
    puts "Coordinate B (#{@point2[0]}, #{@point2[1]})"
    puts "The gradient is #{@gradient}"
  end

  def calculate_points_and_gradient(point_1, point_2)
    x_range = @x_array[-1] - @x_array[0]
    y_range = @y_array[-1] - @y_array[0]
    point_a = [(point_1[0][0] * 5 + point_1[0][1]).to_f, (point_1[1][0] * 5 + point_1[1][1]).to_f]
    point_b = [(point_2[0][0] * 5 + point_2[0][1]).to_f, (point_2[1][0] * 5 + point_2[1][1]).to_f]
    y_difference = ((point_a[1] - point_b[1]) / 130) * y_range
    x_difference = ((point_a[0] - point_b[0]) / 90) * x_range
    x1 = ((point_a[0] / 90) * x_range + @x_array[0]).floor(2)
    y1 = ((point_a[1] / 130) * y_range + @y_array[0]).floor(2)
    x2 = ((point_b[0] / 90) * x_range + @x_array[0]).floor(2)
    y2 = ((point_b[1] / 130) * y_range + @y_array[0]).floor(2)
    @point1 = [x1, y1]
    @point2 = [x2, y2]
    @gradient = (y_difference / x_difference).floor(2)
  end
end

def validity_of_array(array)
  return false unless array.is_a?(Array)

  array.each do |n|
    return false unless n.is_a?(Integer) || n.is_a?(Float)
  end
  true
end



