class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  NAME_KANA_REGEX = /\A[ァ-ヶ]+\z/.freeze
  validates :nickname, presence: true
  validates_format_of :password, with: PASSWORD_REGEX
  with_options presence: true, format: { with: NAME_REGEX } do
    validates :family_name, presence: true
    validates :first_name, presence: true
  end
  with_options presence: true, format: { with: NAME_KANA_REGEX } do
    validates :family_name_kana, presence: true
    validates :first_name_kana, presence: true
  end
  validates :birthday, presence: true
end
