# frozen_string_literal: true

def find_coordinates(x_array, y_array)
  return if x_array.length != y_array.length

  xlength2 = x_array[-1] - x_array[0]
  ylength2 = y_array[-1] - y_array[0]
  xmin = x_array[0]
  ymin = y_array[0]
  
  new_x_array = x_array.map { |x| ((x - xmin) * 90 / xlength2 ) }
  new_y_array = y_array.map { |y| ((y - ymin) * 130 /ylength2 ) }

  pretty_print(format_coordinates(new_x_array, new_y_array))
end

def format_coordinates(x_array, y_array)
  new_array = []
  x_array.each_with_index do |x, i|
    x_coordinate = x.divmod(5)
    x_coordinate = "#{x_coordinate[0]}.#{(x_coordinate[1] * 10).floor}"
    y_coordinate = y_array[i].divmod(5)
    y_coordinate = "#{y_coordinate[0]}.#{(y_coordinate[1] * 10).floor}"

    new_array.push([x_coordinate, y_coordinate])
  end
  new_array
end

def pretty_print(array)
  array.each_with_index do |x, i|
    print "Coordinate #{i+1} X=(#{x[0]}) Y=(#{x[1]}) \n"
  end
end

def calculate_gradient(point_1, point_2, x_array, y_array)
  x_range = x_array[-1] - x_array[0]
  y_range = y_array[-1] - y_array[0]

  point_a = [(point_1[0][0] * 5 + point_1[0][1]).to_f, (point_1[1][0] * 5 + point_1[1][1]).to_f]
  point_b = [(point_2[0][0] * 5 + point_2[0][1]).to_f, (point_2[1][0] * 5 + point_2[1][1]).to_f]

  y_difference = ((point_a[1] - point_b[1]) / 130) * y_range
  x_difference = ((point_a[0] - point_b[0]) / 90) * x_range
  x1 = ((point_a[0] / 90) * x_range + x_array[0]).floor(2)
  y1 = ((point_a[1] / 130) * y_range + y_array[0]).floor(2)
  x2 = ((point_b[0] / 90) * x_range + x_array[0]).floor(2)
  y2 = ((point_b[1] / 130) * y_range + y_array[0]).floor(2)

  puts 'The critical points are ...'
  puts "Coordinate A #{x1}, #{y1}"
  puts "Coordinate B #{x2}, #{y2}"
  puts "The gradient is #{(y_difference / x_difference).floor(2)}"

end

y_hw = [8.8, 12.5, 13.8, 18.7, 20.3]
x_hl = [11, 16.1, 17.6, 22.4, 25]

find_coordinates(x_hl, y_hw)
calculate_gradient([[0, 4], [1, 0]], [[17, 3], [25, 2]], x_hl, y_hw)