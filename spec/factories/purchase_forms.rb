FactoryBot.define do
  factory :purchase_form do
    postal_code    { '123-4567' }
    prefecture_id  { 2 }
    city           { '渋谷区' }
    street_address { '青山1-1-1' }
    building       { '青山ビル101' }
    phone_number   { '09012345678' }
    token          { 'tok_abcdefghijk00000000000000000' }

    # user_id と item_id はテストコード内で手動で渡すので記述しない
  end
end
