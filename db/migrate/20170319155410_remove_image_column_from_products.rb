class RemoveImageColumnFromProducts < ActiveRecord::Migration[5.0]
  def change
    remove_column :products, :img, :string
  end
end
