class Biomarker < ApplicationRecord
  belongs_to :biomarker_category
  has_many :user_biomarkers
  has_many :biomarker_records, through: :user_biomarkers
end
