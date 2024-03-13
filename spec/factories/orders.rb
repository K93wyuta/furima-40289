FactoryBot.define do
  factory :order do
    postcode { '000-0000' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { '川崎市' }
    block { '宮前区' }
    building {'テスト'}
    phone_number { '00000000000' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end

