class ImageScaler

  def scale(image_dimensions, bounding_box)
    set_bounding_box(reformat(bounding_box))
    scaled_dimensions = []

    reformat(image_dimensions).each_slice(2) { |pair|
      width = pair[0]
      height = pair[1]

      ratio = calculate_ratio(width, height)

      scaled_dimensions << (width * ratio).to_i
      scaled_dimensions << (height * ratio).to_i
    }

    {scaled_dimensions: scaled_dimensions,
     bounding_box: reformat(bounding_box)}
  end

  def set_bounding_box(dimensions)
    @bounded_width = dimensions[0]
    @bounded_height = dimensions[1]
  end

  def calculate_ratio(width, height)
    width_ratio = @bounded_width.to_f/width
    height_ratio = @bounded_height.to_f/height

    [width_ratio, height_ratio].min
  end

  def reformat(image_dimensions)
  image_dimensions.split.map(&:to_i)
  end

end
