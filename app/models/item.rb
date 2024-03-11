class Item < ApplicationRecord
  belongs_to :user
  has_one :record
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :delivery_day

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { only_integer: true, other_than: 1, message: "can't be blank" }
  validates :condition_id, numericality: { only_integer: true, other_than: 1, message: "can't be blank" }
  validates :charge_id, numericality: { only_integer: true, other_than: 1, message: "can't be blank" }
  validates :prefecture_id, numericality: { only_integer: true, other_than: 1, message: "can't be blank" }
  validates :delivery_day_id, numericality: { only_integer: true, other_than: 1, message: "can't be blank" }
  validates :price, presence: true, format: { with: /\A[a-z0-9]+\z/i },
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
