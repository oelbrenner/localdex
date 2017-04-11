class Epostcard < ApplicationRecord
  belongs_to :page
  has_many :emails
  mount_uploader :main_image, ImageUploader
end
