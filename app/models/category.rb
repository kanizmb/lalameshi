class Category < ActiveRecord::Base
  mount_uploader :images, PictureUploader
  has_many :restaurant_categories
  has_many :restaurants, :through => :restaurant_categories
end
