class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def subtotal
    
  end
end
