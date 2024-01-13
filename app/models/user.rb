class User < ApplicationRecord

  # A user has one profile picture
  has_one_attached :photo

  # A user has one farmer
  has_one :farmer, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # Include user fields validator
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  validates :sex, presence: true
  validates :country, presence: true
  validates :city, presence: true
  validates :phone, presence: true
  validates :address, presence: true


end
