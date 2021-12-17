class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :prefecture
  belongs_to :shipping_cost
  belongs_to :time_to_ship

  
  belongs_to :user
  has_one_attached :image


  validates :item_name, :explanation, presence: true
  validates :category_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :status_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :shipping_cost_id, numericality: { other_than: 1 ,message: "can't be blank"}
  validates :time_to_ship_id, numericality: { other_than: 1 ,message: "can't be blank"}

end
