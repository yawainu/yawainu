class Category < ActiveRecord::Base
  belongs_to :user
  has_many :galleries, dependent: :destroy

  validates :title, presence: true

end
