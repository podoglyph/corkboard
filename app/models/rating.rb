class Rating
  def avg_rating(pro)
    collect_reviews(pro).average(:rating)
  end

  def collect_reviews(pro)
    Review.where(user_id: pro.id)
  end
end
