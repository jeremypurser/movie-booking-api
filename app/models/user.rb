class User < ApplicationRecord
  has_secure_password

  has_many :tickets, dependent: :destroy
  has_many :show_times, through: :tickets

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
end
