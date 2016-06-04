class Gallery < ActiveRecord::Base
  belongs_to :category

  has_attached_file :image, styles: { medium: "1600x1600>", thumb: "512x384#" },
                            url: "/system/:class/:attachment/:id_partition/:style/:hash.:extension",
                            hash_secret: "longSecretString"

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
                               presence: true,
                               less_than: 5.megabytes
end
