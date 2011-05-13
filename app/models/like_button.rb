class LikeButton < ActiveRecord::Base
  set_inheritance_column :liked_object_class
end
