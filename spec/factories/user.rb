FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "johndoe@email.com"
    admin false
  end
