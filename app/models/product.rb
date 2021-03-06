
class Product < ApplicationRecord
  # must have suppliers table with supplier_id
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  belongs_to :supplier
  has_many :order
  has_many :images
  has_many :carted_products

  def bulleted_description
    return description.split(". ")
  end

  def standard_time
    return created_at.strftime("%A, %b %d")
  end

  def sale_message
    if price < 2
      "Discount Item!"
    else "Everyday Value!!"
    end
  end

  def tax
    price * 0.09
  end

  def total
    price * 1.09
  end

  # same as belongs_to method
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  # same as has_many method
  # def images
  #   Image.where(product_id: id)
  # end

end
