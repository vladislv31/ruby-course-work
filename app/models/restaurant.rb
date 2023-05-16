require 'mini_magick'

class Restaurant < ApplicationRecord
  has_many :products
  has_one_attached :image

  after_save :crop_image

  def crop_image
    # return unless image.attached?
    # image.variant(resize_to_fill: [500, 350]).processed
  end
end
