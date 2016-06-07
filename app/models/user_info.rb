class UserInfo < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: { medium: "512x512#", thumb: "256x256#" },
                            url: "/system/:class/:attachment/:id_partition/:style/:hash.:extension",
                            hash_secret: "longSecretString",
                            default_url:  "/images/dummy_prof.png"

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] },
                               less_than: 5.megabytes

end
