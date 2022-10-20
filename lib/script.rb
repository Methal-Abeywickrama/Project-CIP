# frozen_string_literal: true

def find_coordinates(x_array=Array, y_array=Array)
  return if x_array.length != y_array.length

  xlength2 = x_array[-1] - x_array[0]
  ylength2 = y_array[-1] - y_array[0]
  xmin = x_array[0]
  ymin = y_array[0]
  
  x_array.map! { |x| ((x - xmin) * 90 / xlength2 ) }
  y_array.map! { |y| ((y - ymin) * 130 /ylength2 ) }

  pretty_print(format_coordinates(x_array, y_array))
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


y_hw = [8.8, 12.5, 13.8, 18.7, 20.3]
x_hl = [11, 16.1, 17.6, 22.4, 25]

a3 = [1, 2, 3, 4, 5]
a4 = [6, 7, 8, 9, 10]


find_coordinates(x_hl, y_hw)