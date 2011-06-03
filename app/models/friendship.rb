class Friendship < ActiveRecord::Base
  belongs_to  :user
  belongs_to :friend, :class_name => "User", :foreign_key => "friend_id"
                  
  def before_create
   raise "cannot duplicate friendship" if Friendship.exists?(:user_id => self.user_id, :friend_id => self.friend_id)
   raise "cannot link friends with yourself" if user_id == friend_id 
  end
  
  def after_create
    return if Friendship.exists?(:user_id => self.friend_id, :friend_id => self.user_id)
    logger.debug "creating symmetrical friendship"
    Friendship.create!(:user_id => self.friend_id, :friend_id => self.user_id)
  end
end
