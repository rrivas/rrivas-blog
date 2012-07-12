# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence :title do |n|
      "MyString#{n}"
    end
    content "Content to Post"

    association :author, factory: :user

    factory :post_with_inactive_user do
      association :author, factory: :user, strategy: :build, active: false
    end
  end
end
