class Favorite < ApplicationRecord
  belongs_to :shop, optional: true
  belongs_to :product, optional: true
  belongs_to :user
end
