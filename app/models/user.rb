class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :records_as_buyer, class_name: 'Records', foreign_key: :buyer_id

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
  VALID_NAME_KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates_format_of :password, with: VALID_PASSWORD_REGEX
  validates :nickname, presence: true
  validates :last_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name, presence: true, format: { with: VALID_NAME_REGEX }
  validates :last_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :first_name_kana, presence: true, format: { with: VALID_NAME_KANA_REGEX }
  validates :birthday, presence: true
end
