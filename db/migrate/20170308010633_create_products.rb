class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :description
      t.string :price
      t.string :rating

      t.timestamps
    end
  end
end
