class User < ApplicationRecord
  has_secure_password
  validates :phone, presence: true
  
  def cart_items
    CartItem.where(user_id: id)
  end
end
