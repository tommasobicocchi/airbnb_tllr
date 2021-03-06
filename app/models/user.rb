class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable

  has_many :flats
  has_many :bookings

  # validates_format_of :email,:with => Devise::email_regexp
  # validates :email, presence: true, uniqueness: true
  # validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :phone_number, presence: true
  validates :birthdate, presence: true

  validates :photo, presence: true
   # validates :owner, presence: true
end

