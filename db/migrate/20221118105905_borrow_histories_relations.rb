# frozen_string_literal: true

class BorrowHistoriesRelations < ActiveRecord::Migration[7.0]
  def change
    change_column :borrow_histories, :user_id, :integer, null: false, foreign_key: true
    change_column :borrow_histories, :book_id, :integer, null: false, foreign_key: true
  end
end
