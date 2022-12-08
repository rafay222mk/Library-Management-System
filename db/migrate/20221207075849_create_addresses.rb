class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.integer :zipcode
      t.string :city
      t.string :state
      t.string :country

      t.timestamps
    end
  end
end
