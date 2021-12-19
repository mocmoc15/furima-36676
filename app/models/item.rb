class Item < ApplicationRecord

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :time_to_ship


  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :image
  end

  with_options presence: true, numericality: { other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :prefecture_id
    validates :shipping_cost_id
    validates :time_to_ship_id
  end

  with_options presence: true do
    validates :price, numericality: { only_integer: true, message: "is invalid. Input half-width characters" }
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 ,message: "is out of setting range"}
  end


end

