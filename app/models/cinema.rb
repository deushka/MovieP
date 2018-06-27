class Cinema < ApplicationRecord
  belongs_to :city
  has_many :films, through: :sesions
  has_many :sessions
end
