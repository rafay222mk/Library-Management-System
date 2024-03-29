# frozen_string_literal: true

class BooksController < ApplicationController
  require 'csv'

  load_and_authorize_resource
  before_action :set_book, only: %i[show edit update]
  def index
    @q = Book.ransack(params[:q])
    @pagy, @books = pagy_countless(@q.result(distinct: true).order(created_at: :asc), items: 4)
    respond_to do |format|
      format.html
      format.pdf do
        # render pdf: "Countries.pdf", template: "countries/index.html.erb" # Excluding ".pdf" extension.
        render pdf: "Books.pdf", template: "books/index", formats: [:html]

      end
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to book_path(@book)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    # respond_to do |format|
    #   format.html
    #   format.pdf do
    #     # render pdf: "Book id: #{@book.id}", template: "books/show.html.erb"   # Excluding ".pdf" extension.
    #     render pdf: "Book id: #{@book.id}", template: "books/show/pdf", formats: [:html]
    #   end
    # end
  end

  def edit; end

  def update
    if @book.update(book_params)
      redirect_to book_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, status: :see_other
  end

  def import
    if params[:file].present?
      file = File.read(params[:file])
      csv = CSV.parse(file, headers: true, col_sep: ',')
      begin
        csv.each do |row|
          var = row.to_h.merge(user_id: current_user.id).except('url')
          book = Book.new(var)
          book.grab_image(row['url']) if book.save && row['url'].present?
        end
        redirect_to welcome_home_path, notice: 'Book Updated Sucessfullt'
      rescue StandardError => e
        redirect_to welcome_home_path, notice: 'File format is not correct or data already exist'
      end
    else
      redirect_to welcome_home_path, notice: 'please select file'
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :publish_date, :user_id, :image, :quantity)
  end
end
