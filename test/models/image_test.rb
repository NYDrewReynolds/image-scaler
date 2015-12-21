require 'test_helper'

class ImageTest < ActiveSupport::TestCase

  test "valid with even number of dimension pairs" do
    image = Image.new
    image.scale([200,400],[200,200])
    assert image.valid?
  end

  # test "invalid without even number of dimension pairs" do
  #   image = Image.new
  #   image.scale([200, 400, 300], [200, 200])
  #   assert_not image.valid?
  # end

end
