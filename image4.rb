class Image

  def initialize(array)
  @array = array
  end


  def output_image
  @array.each do |row|
  puts row.join
  end
end

  
  def blur(distance)
    changes = []
    @array.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
         
        if cell == 1
          changes.insert(0, [row_index, cell_index])        
        end
      end
    end 
    changes.each do |item|
      above = item[0] - 1
      @array[above][item[1]] = 1
      below = item[0] + 1
      @array[below][item[1]] = 1 
      left = item[0]
      @array[left][item[1] + 1] = 1 
      
    end 
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [1, 0, 0, 0],
  [0, 0, 0, 0]
])
image.output_image
puts "----"
image.blur(1)
image.output_image


