class User < ApplicationRecord
  has_secure_password
  has_many :products

  VALID_EMAIL_REGEX= /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 validates :email, presence: true, length: {maximum: 50},
                   format: {with: VALID_EMAIL_REGEX},
                   uniqueness: {case_sensitive: false}

 before_save {self.email=email.downcase}
 validates :password, length: {minimum: 6}
 has_secure_password

 has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb:"150x150#"}
 validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
