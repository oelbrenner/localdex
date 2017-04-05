class Epostcard < ApplicationRecord
  belongs_to :page
  mount_uploader :main_image, ImageUploader
end
