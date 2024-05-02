FactoryBot.define do
  factory :item_order_form do
    user_id { FactoryBot.create(:user).id }
    item_id { FactoryBot.create(:item).id }
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code   { '123-4567' }
    prefecture_id { 2 }
    city { 'ひたちなか市' }
    adress { '青山1-1-1' }
    phone_number { Faker::Number.decimal_part(digits: 10) }
  end
end
