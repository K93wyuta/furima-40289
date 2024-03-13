class Order
  include ActiveModel::Model
  attr_accessor :buyer_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :record_id ,:token
  with_options presence: true do
    validates :buyer_id
    validates :item_id
    validates :postcode
    validates :prefecture_id, numericality: { only_integer: true, other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    # validates :building
    validates :phone_number
    validates :token
  end

  def save
    record = Record.create(buyer_id: buyer_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, record_id: record.id )
  end
end