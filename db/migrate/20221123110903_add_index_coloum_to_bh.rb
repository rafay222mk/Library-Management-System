# frozen_string_literal: true

class AddIndexColoumToBh < ActiveRecord::Migration[7.0]
  def change
    add_index :borrow_histories, %i[user_id book_id], unique: true
  end
end
