class User < ApplicationRecord
  has_many :meals
  # has_many :meal_items, through: :meals
  has_many :lists

  validates_uniqueness_of :email
  has_secure_password
end
