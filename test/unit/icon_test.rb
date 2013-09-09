require 'test_helper'

class IconTest < ActiveSupport::TestCase
  fixtures :icons
  test "can show base_64 version of image" do
    facebook_icon = icons(:facebook)

    # Check to see if it's the base64 version of the string 'IMAGEDATABLOB'
    assert_equal "SU1BR0VEQVRBQkxPQg==\n", facebook_icon.base_64
  end
end
