class Order
  include ActiveModel::Model
<<<<<<< Updated upstream
<<<<<<< Updated upstream
  attr_accessor :buyer_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :record_id, :token

=======
  attr_accessor :buyer_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :record_id ,:token
>>>>>>> Stashed changes
  with_options presence: true do
    validates :buyer_id
    validates :item_id
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    validates :postcode, format: { with: /\A\d{3}-\d{4}\z/ }
=======
    validates :postcode
>>>>>>> Stashed changes
=======
    validates :postcode,format: { with: /\A\d{3}-\d{4}\z/ }
>>>>>>> Stashed changes
=======
  attr_accessor :buyer_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :record_id

  with_options presence: true do
    validates :buyer_id
    validates :item_id
    validates :postcode
>>>>>>> Stashed changes
    validates :prefecture_id, numericality: { only_integer: true, other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    # validates :building
<<<<<<< Updated upstream
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
=======
    validates :phone_number
<<<<<<< Updated upstream
>>>>>>> Stashed changes
=======
    validates :phone_number,format: { with: /\A\d{10,11}\z/ }
>>>>>>> Stashed changes
=======
>>>>>>> Stashed changes
    validates :token
  end

  def save
<<<<<<< Updated upstream
    record = Record.create(buyer_id:, item_id:)
    Address.create(postcode:, prefecture_id:, city:, block:, building:,
                   phone_number:, record_id: record.id)
=======
    record = Record.create(buyer_id: buyer_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, record_id: record.id )
>>>>>>> Stashed changes
  end
end
=======
    validates :phone_number
    validates :record_id
  end
  def save
    order = Order.create(buyer_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, record_id: record_id, buyer_id: user.id, item_id: item.id)
  end
end
>>>>>>> Stashed changes
