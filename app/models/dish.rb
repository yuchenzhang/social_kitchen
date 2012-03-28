class Dish < ActiveRecord::Base
  belongs_to  :restaurant
  has_many    :used_ingredients, :dependent => :destroy
  has_many    :ingredients, :through => :used_ingredients        
  has_many    :pictures, :class_name => "::Images::DishPicture", :foreign_key => :owner_id, :dependent => :destroy
  has_many    :want_actions
  has_many    :users, :through => :want_actions
  has_many    :comments
  has_many    :writers, :through => :comments, :source => :user
  attr_accessor :images
  
  def to_json
     super(:methods=>[:image_urls,:avatar])   
  end
  
  def image_urls 
     pictures.map{|p|"http://10.0.1.5:3000" + p.image.url(:original)}
  end 
  
  def after_create
    return unless @images
    @images.each do |im|
      DishPicture.create!(:image =>im)
    end    
  end
                                                                                                    
end
