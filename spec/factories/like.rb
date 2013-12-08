FactoryGirl.define do
  factory :like do
    association :user
    association :movie
  end
end
