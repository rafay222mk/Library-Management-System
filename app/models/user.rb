
# frozen_string_literal: true

class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :borrow_histories, dependent: :destroy
  has_many :addresses, dependent: :destroy, inverse_of: :user
  has_one_attached :image
  accepts_nested_attributes_for :addresses , allow_destroy: true
  scope :std_list, -> { where(role: 'student') }
  scope :lib_list, -> { where(role: 'libraian') }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         authentication_keys: [:login]

  attr_accessor :login

  ROLE_LIST = %w[student libraian].freeze

  def login
    @login || email || user_name
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).where(['lower(user_name) = :value OR lower(email) = :value',
                             { value: login.strip.downcase }]).first
  end

  after_create :send_welcome_email

  def send_welcome_email
    UserMailer.send_welcome(self).deliver!
  end
end
