class Film < ApplicationRecord
  has_many :sessions
  has_many :cinemas, through: :sessions
end
