class User < ActiveRecord::Base
  belongs_to :region
  has_many  :comments
  has_many  :dishes
  has_one   :private_menu
  has_many  :friendships
  has_many  :friends, :through => :friendships
        
  attr_accessor :image
 
  def avatar
    Picture.find_by_sql("select distinct p.* from pictures p,placed_pictures pp where pp.place_type = 'UserAvatar' and pp.place_id = #{id} and pp.picture_id = p.id").first
  end
  
  def after_create
    return unless @image
    UserAvatar.create!(:picture => Picture.create!(:image =>@image), :place_id => self.id)
  end
  
  def after_destroy
    avatar.destroy
  end
end
