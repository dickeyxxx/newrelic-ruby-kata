class Icon < ActiveRecord::Base
  belongs_to :web_site
  attr_accessible :height, :icon, :width

  def base_64
    Base64.encode64(icon)
  end
end
