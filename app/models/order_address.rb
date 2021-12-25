class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :address, :building, :telephone_number, :order_id

  with_options presence: true do
    validates :user_id,
    validates :item_id,
    validates :postal_code,
    validates :prefecture,
    validates :municipality,
    validates :address,
    validates :telephone_number,
    validates :order
  end
  
  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, municipality: municipality, address: address, building: building, order_id: order.id)
  end



end