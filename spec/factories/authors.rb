FactoryBot.define do
  factory :author do
    sequence(:first_name) { |n| "John (#{n})" }
    sequence(:last_name) { |n| "Smith (#{n})" }
    sequence(:date_of_birth) { 40.years.ago }
  end
end
