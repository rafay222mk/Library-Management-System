# frozen_string_literal: true

class ChangeDateFormat < ActiveRecord::Migration[7.0]
  def change
    change_column :borrow_histories, :created_at, :date
  end
end
