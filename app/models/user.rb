class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :first_name
    validates :last_name
    validates :first_name_kana
    validates :last_name_kana
    validates :birthday
  end

  validates :email, uniqueness: { case_sensitive: false }
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,}+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }
  validates :password, :password_confirmation, confirmation: true

  with_options format: { with: /\A[ァ-ヶー－]+\z/.freeze } do
    validates :first_name_kana
    validates :last_name_kana
  end

  with_options format: { with: /\A[ぁ-んァ-ン一-龥]/.freeze } do
    validates :first_name
    validates :last_name
  end

  has_many :items
  has_many :histories
end
