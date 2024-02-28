class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  devise :database_authenticatable, :registerable, :rememberable, :validatable
end
