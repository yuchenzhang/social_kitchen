class Dish < ActiveRecord::Base
  has_one     :recipe
  has_many    :ingredients, :through => :recipe
  belongs_to  :category, :class_name => "DishCategory"
  has_many    :pictures, :class_name => "Picture", :finder_sql => 
  %q(select distinct p.* from pictures p,placed_pictures pp where pp.place_type = 'DishPicture' and pp.place_id = #{id} and pp.picture_id = p.id)
  
  
  def to_json
     super(:methods=>:image_urls)   
  end
  
  def image_urls 
     pictures.map{|p|p.image.url(:original)}
  end
end
