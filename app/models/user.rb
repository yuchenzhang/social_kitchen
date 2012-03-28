class User < ActiveRecord::Base 
  has_many :authentications  
  # Include default devise modules. Others available are:  
  # :token_authenticatable, :lockable, :timeoutable and :activatable  
  # :confirmable,  
  devise :database_authenticatable, :registerable,   
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable 

  # Setup accessible (or protected) attributes for your model  
  attr_accessible :email, :password, :password_confirmation, :facebook_id  
                     
  has_many  :comments
  has_many  :dishes
  has_many  :follow_actions, :class_name => "Action::Follow", :foreign_key => :user_id_followed
  has_many  :followers, :through => :follow_actions
  has_many  :be_followed_actions, :class_name => "Action::Follow", :foreign_key => :user_id_follower
  has_many  :followeds, :through => :be_followed_actions
  has_many  :want_actions, :class_name => "Action::Want"
  has_many  :wanted_dishes, :through => :want_actions, :source => :dish
  has_many  :tried_actions, :class_name =>"Action::Tried"
  has_many  :tried_dishes,  :through => :tried_actions, :source => :dish
  has_many  :avatars, :class_name => "Images::Avatar", :foreign_key => :owner_id
  
  # after_save :find_friends
        
  attr_accessor :image
  
  
  def find_friends 
    new_friends_on_facebook.each do |f|
      friends << f
    end
  end
  
  class << self
    def find_for_facebook_oauth(access_token, signed_in_resource=nil)
      data = access_token['extra']['user_hash']
      if user = User.find_by_email(data["email"])
        user
      else # Create a user with a stub password. 
        User.create(:email => data["email"], :password => Devise.friendly_token[0,20], :facebook_id => data["id"]) 
      end
    end
  end
  
  private
  def new_friends_on_facebook
    my_app = FbGraph::Application.new(FacebookSettings.app_id)
    acc_tok = my_app.get_access_token(FacebookSettings.app_secret)
    me = FbGraph::User.new(facebook_id,:access_token => acc_tok).fetch
    friends_to_connect = User.where("facebook_id in (?)", me.friends.map(&:identifier) - friends.map(&:facebook_id))
    friends_to_connect
  end
  
end
