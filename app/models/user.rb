class User < ActiveRecord::Base 
  has_many :authentications  
  # Include default devise modules. Others available are:  
  # :token_authenticatable, :lockable, :timeoutable and :activatable  
  # :confirmable,  
  devise :database_authenticatable, :registerable,   
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable 

  # Setup accessible (or protected) attributes for your model  
  attr_accessible :email, :password, :password_confirmation, :facebook_id  
    
  belongs_to :region
  has_many  :comments
  has_many  :dishes
  has_one   :private_menu
  has_many  :friendships
  has_many  :friends, :through => :friendships
  
  after_create :create_avatar, :find_friends
  after_save  :find_friends
  after_destroy :remove_avatar
        
  attr_accessor :image
 
  def avatar
    Picture.find_by_sql("select distinct p.* from pictures p,placed_pictures pp where pp.place_type = 'UserAvatar' and pp.place_id = #{id} and pp.picture_id = p.id").first
  end
  
  def create_avatar
    return unless @image
    UserAvatar.create!(:picture => Picture.create!(:image =>@image), :place_id => self.id)
  end
  
  def remove_avatar
    if ua = UserAvatar.where(:place_id => self.id).first
      ua.destroy
    end
  end
  
  
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
