require 'rails_helper'

RSpec.describe "Image Scaling API" do
  it 'resizes a single image' do

    get '/api/v1/images/scale?image_dimensions=200+400&bounding_box=200+200'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['scaled_dimensions']).to eq([100, 200])
    expect(json['bounding_box']).to eq([200, 200])
  end

  it 'resizes multiple images at a time' do

    get '/api/v1/images/scale?image_dimensions=1256+1200+600+800+200+200+400+200+800+1256&bounding_box=200+200'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['scaled_dimensions']).to eq([200, 191, 150, 200, 200, 200, 200, 100, 127, 200])
    expect(json['bounding_box']).to eq([200, 200])
  end

  it 'resizes images in uneven bounding box' do

    get '/api/v1/images/scale?image_dimensions=200+400&bounding_box=100+200'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['scaled_dimensions']).to eq([100, 200])
    expect(json['bounding_box']).to eq([100, 200])
  end

  it 'resizes image with higher width' do

    get '/api/v1/images/scale?image_dimensions=1256+1200&bounding_box=200+200'

    json = JSON.parse(response.body)

    expect(response).to be_success
    expect(json['scaled_dimensions']).to eq([200, 191])
    expect(json['bounding_box']).to eq([200, 200])
  end

  it 'reformats dimensions correctly' do
    image_scaler = ImageScaler.new
    reformatted  = image_scaler.reformat("200 200")

    expect(reformatted).to eq([200,200])
  end


end
