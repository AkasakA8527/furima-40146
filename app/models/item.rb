class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_intention
  has_one_attached :image

  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :whopay_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipday_id, presence: true
  validates :price, presence: true
end
