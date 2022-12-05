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

  def grab_image(url)
    img = open(url)
    image.attach(io: img, filename: 'pic.png')
  end
end
