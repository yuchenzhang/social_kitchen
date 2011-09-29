class Dish < ActiveRecord::Base
  belongs_to  :user
  has_one     :recipe
  has_many    :ingredients, :through => :recipe
  belongs_to  :category, :class_name => "DishCategory"
  has_many    :pictures, :class_name => "Picture", :finder_sql => 
  %q(select distinct p.* from pictures p,placed_pictures pp where pp.place_type = 'DishPicture' and pp.place_id = #{id} and pp.picture_id = p.id)
  
  attr_accessor :images
  
  def to_json
     super(:methods=>[:image_urls,:avatar])   
  end
  
  def image_urls 
     pictures.map{|p|"http://10.0.1.5:3000" + p.image.url(:original)}
  end 
  
  def avatar
    return unless user.avatar
    "http://10.0.1.5:3000" + user.avatar.image.url(:small)
  end
  
  def after_create
    return unless @images
    @images.each do |im|
      DishPicture.create!(:picture => Picture.create!(:image =>im), :place_id => self.id)
    end    
  end
  
  def after_destroy
    pictures.destroy_all
  end
end
