class FoodiePicture < Picture
  belongs_to :foodie, :foreign_key => :owner_id
end