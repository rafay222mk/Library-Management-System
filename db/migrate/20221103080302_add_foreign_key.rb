# frozen_string_literal: true

class AddForeignKey < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :user_id, :integer, null: false, foreign_key: true
  end
end
