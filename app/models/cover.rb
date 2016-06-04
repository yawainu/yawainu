class Cover < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, url: "/system/:class/:attachment/:id_partition/:style/:hash.:extension",
                            hash_secret: "longSecretString"

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
                               presence: true,
                               less_than: 5.megabytes

end
