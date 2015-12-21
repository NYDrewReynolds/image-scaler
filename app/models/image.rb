class Image < ActiveRecord::Base

  def self.scale(image_dimensions, bounding_box)
    set_bounding_box(bounding_box)
    scaled_dimensions = []
    @ratio = 0
    # num_of_pairs = (image_dimensions.length / 2)  Use later to check even number is sent

    image_dimensions.each_slice(2) { |pair|
      width  = pair[0]
      height = pair[1]

      if width >= height
        @ratio = @bounded_width.to_f/width
      else
        @ratio = @bounded_height.to_f/height
      end

      scaled_dimensions << (width * @ratio).to_i
      scaled_dimensions << (height * @ratio).to_i
    }

    {scaled_dimensions: scaled_dimensions,
     bounding_box: bounding_box}
  end

  def self.set_bounding_box(dimensions)
    @bounded_width = dimensions[0]
    @bounded_height = dimensions[1]
  end

end
