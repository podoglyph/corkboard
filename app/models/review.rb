class Review < ApplicationRecord
  belongs_to :pro, foreign_key: 'user_id'
  belongs_to :project
  validates :comment, presence: true
  validates :rating, presence: true

  def star_rated
    yellow_star_html = "<i class='fa fa-star star-rated' aria-hidden='true'></i>"
    (yellow_star_html * rating.round).html_safe
  end

  def star_denied
    gray_star_html = "<i class='fa fa-star star-denied' aria-hidden='true'></i>"
    (gray_star_html * (5 - rating.round)).html_safe
  end
end
