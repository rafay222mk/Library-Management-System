class AddQunatityColoumToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books , :quantity ,:integer, default: 0
  end
end