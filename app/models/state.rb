class State < ApplicationRecord
  belongs_to :country
  validates :state_name , :country_id , presence: :true , uniqueness: :true
end
