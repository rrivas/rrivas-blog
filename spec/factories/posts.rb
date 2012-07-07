# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :post do
    sequence :title do |n|
      "MyString#{n}"
    end
    content "Content to Post"
  end
end
