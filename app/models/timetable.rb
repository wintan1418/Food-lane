class Timetable < ApplicationRecord
  belongs_to :user
  has_many :meals, dependent: :destroy
  has_many :invitations, dependent: :destroy

  accepts_nested_attributes_for :meals, allow_destroy: true, reject_if: :all_blank

  validates :title, presence: true
  validates :timetable_type, presence: true, inclusion: { in: %w[monthly weekly custom] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_after_start_date

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date < start_date
      errors.add(:end_date, "must be after the start date")
    end
  end
end
