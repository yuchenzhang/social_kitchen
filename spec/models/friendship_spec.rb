require 'spec_helper'

describe Friendship do
  
  describe 'create reverse friendship' do
    before do
      john = Factory.build :user
      smith = Factory.build :user
      @a_friendship = Factory.build :friendship, :user => john, :friend => smith
    end
    
    it "should create a reverse friendship after being created" do
      expect { @a_friendship.save }.to change(Friendship, :count).by(2)
    end
    
    it "should remove the reverse friendship after being destroyed" do
      @a_friendship.save
      expect { @a_friendship.reload.destroy }.to change(Friendship, :count).by(-2)
    end
  end
  
end