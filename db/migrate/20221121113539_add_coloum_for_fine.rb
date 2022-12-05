# frozen_string_literal: true

class AddColoumForFine < ActiveRecord::Migration[7.0]
  def change
    add_column :borrow_histories, :due_date, :date
    add_column :borrow_histories, :fine, :integer
  end
end
