FactoryBot.define do
  factory :customer, aliases: [:user] do
    # name { "Jackson Pires" }
    # email { "jackson@pires.com" }
    name { Faker::Name.name }
    email { Faker::Internet.email }
  end
end