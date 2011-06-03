class PlacedPicture < ActiveRecord::Base
  set_inheritance_column  :place_type
  belongs_to  :picture
end
