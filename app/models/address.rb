class Address < ApplicationRecord
  belongs_to :user

  validates :city, :state, :country, :zipcode, length: { maximum: 25 }
  validates :address1 , :address2, :city, :state, :country, :zipcode,  presence: true

end
