class Shop < ApplicationRecord
  has_many :products, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def current_user_favorit(current_user)
    if self.favorites.present?
      @favorite = self.favorites.find_by(user: current_user)
    else
      @favorite = nil
    end
  end
  def favorited_by?(current_user)
    favorites.exists?(user_id: current_user.id)
  end
end
