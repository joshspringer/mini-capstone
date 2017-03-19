
class Supplier < ApplicationRecord
  # must have products table with supplier_id
  has_many :products

  # same as has_many method
  # def products
  #   Product.where(supplier_id: id)
  # end

end
