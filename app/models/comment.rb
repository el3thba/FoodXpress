class Comment < ApplicationRecord

    # has_many :comments, dependent: :destroy
    has_many :posts
	validates :name, presence: true, length: {minimum: 5}
	validates :body,  presence: true

    has_attached_file :image, styles: { large: "600x600>", medium: "300x300>"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

end
