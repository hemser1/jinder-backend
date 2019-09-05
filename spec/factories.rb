FactoryBot.define do

factory :employer, class: Employer do
    first_name { Faker::Lorem.first_name }
    last_name { Faker::Lorem.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    bio { Faker::Lorem.sentence }
    company_url { Faker::Internet.domain_name }
  end
end
