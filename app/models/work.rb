class Work < ActiveRecord::Base
  belongs_to :user

  validates :start_date, presence: true
  validates :comment,    presence: true

end
