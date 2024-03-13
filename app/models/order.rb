class Order
  include ActiveModel::Model
  attr_accessor :buyer_id, :item_id, :postcode, :prefecture_id, :city, :block, :building, :phone_number, :record_id, :token

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
    validates :prefecture_id, numericality: { only_integer: true, other_than: 1, message: "can't be blank" }
    validates :city
    validates :block
    # validates :building
<<<<<<< Updated upstream
<<<<<<< Updated upstream
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
=======
    validates :phone_number
>>>>>>> Stashed changes
=======
    validates :phone_number,format: { with: /\A\d{10,11}\z/ }
>>>>>>> Stashed changes
    validates :token
  end

  def save
    record = Record.create(buyer_id:, item_id:)
    Address.create(postcode:, prefecture_id:, city:, block:, building:,
                   phone_number:, record_id: record.id)
  end
end
