class Image

  def initialize(array)
  @array = array
  end


  def output_image
  @array.each do |row|
  puts row.join
  end
end

  
  def blur(manhattan_distance)
    changes = []
    @array.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
         
        if cell == 1
          changes.insert(0, [row_index, cell_index])        
        end
      end
    end 
    changes.each do |item|
      
      (0...manhattan_distance).each do |n| 

        above = item[0] - (n + 1)
        @array[above][item[1]] = 1
        below = item[0] + (n + 1)
        if below < @array.length
          @array[below][item[1]] = 1
        end
        left = item[1] - (n + 1) 
        @array[item[0]][left] = 1
        right = item[1] + (n + 1)
        @array[item[0]][right] = 1
        distance = item[0] - above + item[1] - left
        if distance <= manhattan_distance   
          @array[above][left] = 1
        end 
        distance = item[0] - above - item[1] + right
        if distance <= manhattan_distance
          @array[above][right] = 1
        end
        distance = item[0] + below - item[1] - left
        if distance <= manhattan_distance   
          @array[below][left] = 1
        end
        distance = below - item[0] + right - item[1]
        if distance <= manhattan_distance
          if below < @array.length && right < @array[0].length 
           @array[below][right] = 1
          end
        end
      end
    end 
  end
end

image = Image.new([
  
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0],
  [0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0]
])
image.output_image
puts "----"
image.blur(2)
image.output_image


