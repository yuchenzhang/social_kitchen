User.class_eval do
  skip_callback :save, :after, :find_friends
  skip_callback :create, :after, :find_friends
end

FactoryGirl.define  do
  factory :user, :aliases => [:friend] do
    sequence(:email)  {|n| "user#{n}@localhost.localhost"}
    password "password"
    password_confirmation "password"
    sequence(:facebook_id)  {|n| "FACEBOOK#{n}"}
  end
end
  