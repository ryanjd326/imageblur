class Image

  def initialize(picture)
    @picture = picture
  end

  def get_coordinates
    coordinates = []
      @picture.each_with_index do |row, row_number|
        row.each_with_index do |item, col_number|
          if item == 1
            coordinates << [row_number, col_number]
          end
        end
      end
    coordinates
  end

  def blur!
    coordinates = get_coordinates
      

    @picture.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        coordinates.each do |found_row_number, found_col_number|

          if row_number == found_row_number && col_number == found_col_number
            @picture[row_number -1][col_number] = 1 unless row_number == 0 # Up
            @picture[row_number +1][col_number] = 1 unless row_number == @picture.length-1 # Down
            @picture[row_number][col_number -1] = 1 unless col_number == 0 # Left
            @picture[row_number][col_number +1] = 1 unless col_number == @picture[row_number].length-1 # Right
          end
        end
      end
    end
  end

  def blur_distance (number)
    number.times do
      blur!
    end
  end

  def output_image
    @picture.each do |row|
      puts row.join
    end
  end
end


image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 1, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 1, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0]
])
image.output_image
puts
image.blur_distance(3)

image.output_image