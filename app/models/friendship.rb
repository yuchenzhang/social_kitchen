class Friendship < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :friend, :class_name => "User", :foreign_key => "friend_id"
  
  validates_uniqueness_of :friend_id, :scope => :user_id, :message => "must be unique" 
  
  def save_with_reverse_friendship
    save_without_reverse_friendship
    return if Friendship.exists?(:user_id => self.friend_id, :friend_id => self.user_id)
    logger.debug "creating reverse friendship"
    Friendship.create!(:user_id => self.friend_id, :friend_id => self.user_id)
  end
  alias_method_chain :save, :reverse_friendship
  
  def destroy_with_reverse_friendship
    destroy_without_reverse_friendship
    if fs = Friendship.where(:user_id => self.friend_id, :friend_id => self.user_id).first
      logger.debug "destroying reverse friendship"
      fs.destroy
    end 
  end
  alias_method_chain :destroy, :reverse_friendship
end
