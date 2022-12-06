# frozen_string_literal: true

class Book < ApplicationRecord
  require 'open-uri'
  belongs_to :user
  has_one_attached :image
  # before_save :grab_image

  has_many :borrow_histories, dependent: :destroy
  validates :title, uniqueness: true
  validates :description,
            :publish_date, presence: true
  validates :title, length: { maximum: 25 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }

  #after_create :update_quantity

  # def update_quantity(quantity)
  #   debugger
  #   quantity =book.quantity
  #   if borrow_histories.create
  #     debugger
  #     quantity - 1
  #   elsif borrow_histories.delete
  #     quantity + 1
  #   end
  # end

  def grab_image(url)
    img = open(url)
    image.attach(io: img, filename: 'pic.png')
  end
end
