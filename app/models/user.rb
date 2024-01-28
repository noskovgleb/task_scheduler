class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :validatable
  has_many :tasks, dependent: :destroy
end
