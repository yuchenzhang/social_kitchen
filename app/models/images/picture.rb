class Images::Picture < ActiveRecord::Base
  validates_presence_of :owner_id, :on => :create, :message => "can't be blank"
  has_attached_file :image,
      :styles => {
        :thumb=> "100x100#",
        :small  => "150x150>" }
end
