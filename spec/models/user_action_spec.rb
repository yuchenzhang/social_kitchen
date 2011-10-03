require 'spec_helper'

describe UserAction do
  
  it "should validate presence of user_id" do
    action = Factory.build :user_action, :user => nil
    expect {action.user = Factory.create :user}.to change(action, :valid?).from(false).to(true)
  end
  
  it "should validate presence of foodie_id" do
    action = Factory.build :user_action, :foodie => nil
    expect {action.foodie = Factory.create :foodie}.to change(action, :valid?).from(false).to(true)
  end
end
