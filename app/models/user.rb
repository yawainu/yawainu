class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :categories, dependent: :destroy
  has_many :works,      dependent: :destroy
  has_one  :cover,      dependent: :destroy
  has_one  :display,    dependent: :destroy
  has_one  :user_info,  dependent: :destroy

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    uniqueness: {case_sensitive: false},
                    length:     {maximum: 255},
                    format:     {with: VALID_EMAIL_REGEX}

end
