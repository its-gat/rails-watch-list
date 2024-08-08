class Bookmark < ApplicationRecord
  belongs_to :movie
  validates :movie, presence: true
  belongs_to :list
  validates :list, presence: true
  validates_uniqueness_of :movie_id, scope: :list_id
  validates :comment, presence: true
  validates :comment, length: { minimum: 6 }
end
