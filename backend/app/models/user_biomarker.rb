class UserBiomarker < ApplicationRecord
  belongs_to :user
  belongs_to :biomarker

  has_many :biomarker_records

  validates :user_id, uniqueness: { scope: :biomarker_id }
end
