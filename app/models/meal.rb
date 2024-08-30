class Meal < ApplicationRecord
  belongs_to :timetable
  has_many :ingredients, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :ratings, dependent: :destroy

  accepts_nested_attributes_for :ingredients, allow_destroy: true, reject_if: :all_blank

  validates :name, presence: true
  validates :recipe, presence: true
end
