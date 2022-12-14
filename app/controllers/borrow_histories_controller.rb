# frozen_string_literal: true

class BorrowHistoriesController < ApplicationController
  def index; end

  def new
    @borrow = BorrowHistory.new
  end

  def create
    @borrow = BorrowHistory.new(borrow_params)
    if @borrow.save
      book = @borrow.book
      quan = book.quantity
      book.update_columns(quantity: quan  -1)
      redirect_to books_path, notice: 'Borrowed Successfully'
    else
      # debugger
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @borrow = BorrowHistory.find(params[:id])
  end

  def destroy
    @borrow = BorrowHistory.find(params[:id])
    if @borrow.destroy
      book = @borrow.book
      quan = book.quantity
      book.update_columns(quantity: quan  +1)
      redirect_to showbh_user_path(current_user.id), status: :see_other
    end
  end

  private

  def borrow_params
    params.require(:borrow_history).permit(:book_id, :user_id, :due_date, :status)
  end
end
