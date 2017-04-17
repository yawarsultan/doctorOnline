class Post < ApplicationRecord
has_many :comments, as: :commentable
belongs_to :user
extend FriendlyId
friendly_id :slug_candidates, use: [:slugged, :finders]

  def slug_candidates
    [
      :question,
      [:question]
    ]
  end
end
