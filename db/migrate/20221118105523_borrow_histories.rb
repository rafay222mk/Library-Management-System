# frozen_string_literal: true

class BorrowHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :borrow_histories do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
