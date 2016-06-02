class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    uniqueness: {case_sensitive: false},
                    length:     {maximum: 255},
                    format:     {with: VALID_EMAIL_REGEX}

end
