# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name "MyString"
    last_name "MyString"
    sequence :email do |n|
      "myemail#{n}@email.com"
    end
    
    password "password1"
  end
end
