FactoryGirl.define do
  factory :foodie do
    sequence(:name) {|n|"foodie#{n}"}
    description "this is a foodie"
  end
end