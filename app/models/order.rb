class Order < ApplicationRecord
  belongs_to :user
  has_many :carted_products

  def subtotal
    subtotal = 0
    carted_products.each do |carted_product|
      subtotal += (carted_product.product.price * carted_product.quantity)
    end
    subtotal
  end

  def tax
    tax = 0
    carted_products.each do |carted_product|
    tax += (carted_product.product.tax * carted_product.quantity)
    end
    tax
  end
end
