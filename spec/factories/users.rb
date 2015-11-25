FactoryGirl.define do
  factory :user do
    nom Faker::Name.first_name
    email Faker::Internet.email

    factory :user_with_items do
      transient do
        items_count 3
      end
      after(:create) do |user, evaluator|
        create_list(:item, evaluator.items_count, user: user)
      end
    end
  end
end
