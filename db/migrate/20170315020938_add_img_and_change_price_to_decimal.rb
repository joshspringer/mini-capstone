class AddImgAndChangePriceToDecimal < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :img, :string
    change_column :products, :price, "numeric USING CAST(price AS numeric)"
    change_column :products, :price, :decimal, precision: 9, scale: 2
  end
end
