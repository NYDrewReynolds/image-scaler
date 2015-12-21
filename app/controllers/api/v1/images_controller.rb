class Api::V1::ImagesController < ApplicationController
  respond_to :json, :xml

  def scale_images
    respond_with Image.scale(params[:image_dimensions].split.map(&:to_i),
                             params[:bounding_box].split.map(&:to_i))
  end

end
