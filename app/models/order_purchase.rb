class OrderPurchase
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id,
                :city, :house_number, :building_name, :phone_number, :token

  with_options presence: true do
    #    validates :price,
    #              numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1_000_000,
    #                              message: 'is invalid' }
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
  end

  def save
    order = Order.create(user_id:, item_id:)
    Purchase.create(order_id: order.id, postal_code:, prefecture_id:, city:,
                    house_number:, building_name:, phone_number:)
  end
end
