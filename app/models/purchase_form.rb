class PurchaseForm
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :street_addresses, :building,
                :phone_number, :user_id, :item_id, :token
end
