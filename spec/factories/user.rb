FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "test#{n}@foobar.com" }
    name 'FooBar'
  end
end
