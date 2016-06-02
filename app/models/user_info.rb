class UserInfo < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, styles: { medium: "256x192", thumb: "128x96" },
                            url: ":rails_root/public/system/:class/:attachment/:id_partition/:style/:hash.:extension"
                            hash_secret: "longSecretString"

  validates_attachment :image, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

end
