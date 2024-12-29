class BiomarkerRecord < ApplicationRecord
  belongs_to :user_biomarker

  validates :value, presence: true
  validates :recorded_at, presence: true

  scope :recent, -> { order(recorded_at: :desc) }
end
