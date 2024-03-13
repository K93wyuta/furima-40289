FactoryBot.define do
  factory :record do
    association :buyer, factory: :user
    association :item
  end
end
