class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  mount_uploader :imagetwo, ImageUploader
  mount_uploader :imagethree, ImageUploader
  belongs_to :user
  belongs_to :shop
  belongs_to :location
  has_one    :city,  through: :location
  has_one    :state, through: :city
end
