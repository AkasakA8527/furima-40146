class Item < ApplicationRecord
  belongs_to :user
  has_one :purchase_intention
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :whopay
  belongs_to :prefecture
  belongs_to :shipday

  validates :image, presence: true
  validates :item_name, presence: true
  validates :description, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :whopay_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipday_id, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :category_id, :condition_id, :whopay_id, :prefecture_id, :shipday_id,
            numericality: { other_than: 1, message: "can't be blank" }
end
