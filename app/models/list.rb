class List < ApplicationRecord
  has_many :movies, through: :bookmarks
  has_many :bookmarks, dependant: :destroy

  validates :name, presence: true
end
