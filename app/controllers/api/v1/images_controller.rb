class Api::V1::ImagesController < ApplicationController
  respond_to :json, :xml

  def scale_images
    respond_with ImageScaler.new.scale(params[:image_dimensions],
                             params[:bounding_box])
  end

end
