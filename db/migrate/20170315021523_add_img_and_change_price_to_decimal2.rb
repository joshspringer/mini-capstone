class AddImgAndChangePriceToDecimal2 < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :in_stock, :boolean
    change_column :products, :description, :text
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 9, scale: 2
  end
end
