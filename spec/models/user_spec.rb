require 'spec_helper'

describe User do
  describe :avatar do
    before do
      @user = Factory.build :user, :image => "non_existing_image.jpg"
    end
    
    it "should create the avatar right after being created" do
      expect {@user.save}.to change(UserAvatar,:count).by(1)
    end
    
    it "should remove the avatar right after being destroyed" do
      @user.save
      expect {@user.destroy}.to change(UserAvatar, :count).by(-1)
    end
  end
  
  describe "recommends foodies" do
    pending
  end
end
