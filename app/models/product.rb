
class Product < ApplicationRecord
  # must have suppliers table with supplier_id
  belongs_to :supplier

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

end
