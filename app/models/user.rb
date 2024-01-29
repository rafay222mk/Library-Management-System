
# frozen_string_literal: true

class User < ApplicationRecord
  require 'csv'
  require 'open-uri'
  has_many :books, dependent: :destroy
  has_many :borrow_histories, dependent: :destroy
  has_many :addresses, dependent: :destroy, inverse_of: :user
  has_one_attached :image
  accepts_nested_attributes_for :addresses , allow_destroy: true
  scope :std_list, lambda { where(role: 'student') }
  scope :lib_list, lambda { where(role: 'libraian') }
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

  validates :user_name, presence: true

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
    # debugger
    UserMailer.send_welcome(self).deliver!
  end

  def self.to_csv
    attributes = %w{ id user_name email }
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |student|
        csv << attributes.map { |attr| student.send(attr)  }
      end
    end
  end
  def grab_image(url)
    img = open(url)
    image.attach(io: img, filename: 'pic.png')
  end

end
