# frozen_string_literal: true

class AddDefaultValueToRole < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :role, :string, deafult: 'student'
  end
end
