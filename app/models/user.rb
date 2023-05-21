class User < ApplicationRecord
  has_secure_password
  validates :phone, presence: true
  has_many :orders
  validates :email, uniqueness: true
  validates :phone, uniqueness: true
  
  def cart_items
    CartItem.where(user_id: id)
  end
end
