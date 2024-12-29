# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
BiomarkerCategory.destroy_all

# Create categories
categories = {
  blood_count: BiomarkerCategory.create!(
    name: "Complete Blood Count",
    description: "Basic blood cell measurements that evaluate overall health"
  ),

  metabolic: BiomarkerCategory.create!(
    name: "Metabolic Panel",
    description: "Measures kidney function, blood sugar, and electrolyte balance"
  ),

  lipids: BiomarkerCategory.create!(
    name: "Lipid Panel",
    description: "Measures cardiovascular health and cholesterol levels"
  ),

  thyroid: BiomarkerCategory.create!(
    name: "Thyroid Function",
    description: "Evaluates thyroid gland function and metabolism"
  ),

  inflammation: BiomarkerCategory.create!(
    name: "Inflammation Markers",
    description: "Indicators of inflammation and immune response"
  ),

  vitamins: BiomarkerCategory.create!(
    name: "Vitamins & Minerals",
    description: "Essential nutrients and mineral levels"
  ),

  hormones: BiomarkerCategory.create!(
    name: "Hormones",
    description: "Key hormones affecting metabolism, growth, and reproduction"
  ),

  cancer: BiomarkerCategory.create!(
    name: "Cancer Markers",
    description: "Indicators used in cancer screening and monitoring"
  ),

  autoimmune: BiomarkerCategory.create!(
    name: "Autoimmune Markers",
    description: "Indicators of autoimmune conditions"
  )
}

# Create biomarkers
[
  # Complete Blood Count
  {
    name: "Hemoglobin",
    code: "HGB",
    unit: "g/dL",
    reference_range: "13.5-17.5 g/dL (male), 12.0-15.5 g/dL (female)",
    description: "Protein in red blood cells that carries oxygen",
    category: :blood_count
  },
  {
    name: "White Blood Cell Count",
    code: "WBC",
    unit: "K/µL",
    reference_range: "4.5-11.0 K/µL",
    description: "Measure of immune cells in blood",
    category: :blood_count
  },
  {
    name: "Platelet Count",
    code: "PLT",
    unit: "K/µL",
    reference_range: "150-450 K/µL",
    description: "Blood cells involved in clotting",
    category: :blood_count
  },

  # Metabolic Panel
  {
    name: "Glucose",
    code: "GLU",
    unit: "mg/dL",
    reference_range: "70-99 mg/dL",
    description: "Blood sugar level",
    category: :metabolic
  },
  {
    name: "Creatinine",
    code: "CREA",
    unit: "mg/dL",
    reference_range: "0.7-1.3 mg/dL",
    description: "Kidney function indicator",
    category: :metabolic
  },
  {
    name: "Sodium",
    code: "Na",
    unit: "mEq/L",
    reference_range: "135-145 mEq/L",
    description: "Essential electrolyte",
    category: :metabolic
  },

  # Lipid Panel
  {
    name: "Total Cholesterol",
    code: "CHOL",
    unit: "mg/dL",
    reference_range: "<200 mg/dL",
    description: "Combined cholesterol measurement",
    category: :lipids
  },
  {
    name: "HDL Cholesterol",
    code: "HDL",
    unit: "mg/dL",
    reference_range: ">40 mg/dL",
    description: "Good cholesterol",
    category: :lipids
  },
  {
    name: "LDL Cholesterol",
    code: "LDL",
    unit: "mg/dL",
    reference_range: "<100 mg/dL",
    description: "Bad cholesterol",
    category: :lipids
  },

  # Thyroid Function
  {
    name: "Thyroid Stimulating Hormone",
    code: "TSH",
    unit: "mIU/L",
    reference_range: "0.4-4.0 mIU/L",
    description: "Primary thyroid function test",
    category: :thyroid
  },
  {
    name: "Free T4",
    code: "FT4",
    unit: "ng/dL",
    reference_range: "0.8-1.8 ng/dL",
    description: "Active thyroid hormone",
    category: :thyroid
  },

  # Inflammation Markers
  {
    name: "C-Reactive Protein",
    code: "CRP",
    unit: "mg/L",
    reference_range: "<3.0 mg/L",
    description: "General inflammation marker",
    category: :inflammation
  },
  {
    name: "Erythrocyte Sedimentation Rate",
    code: "ESR",
    unit: "mm/hr",
    reference_range: "0-22 mm/hr (male), 0-29 mm/hr (female)",
    description: "Inflammation indicator",
    category: :inflammation
  },

  # Vitamins & Minerals
  {
    name: "Vitamin D, 25-Hydroxy",
    code: "VIT-D",
    unit: "ng/mL",
    reference_range: "30-100 ng/mL",
    description: "Vitamin D status",
    category: :vitamins
  },
  {
    name: "Vitamin B12",
    code: "B12",
    unit: "pg/mL",
    reference_range: "200-900 pg/mL",
    description: "Vitamin B12 status",
    category: :vitamins
  },
  {
    name: "Ferritin",
    code: "FER",
    unit: "ng/mL",
    reference_range: "20-250 ng/mL (male), 10-120 ng/mL (female)",
    description: "Iron storage protein",
    category: :vitamins
  },

  # Hormones
  {
    name: "Testosterone, Total",
    code: "TEST",
    unit: "ng/dL",
    reference_range: "280-1100 ng/dL (male), 15-70 ng/dL (female)",
    description: "Primary male sex hormone",
    category: :hormones
  },
  {
    name: "Cortisol",
    code: "CORT",
    unit: "µg/dL",
    reference_range: "6-23 µg/dL (morning)",
    description: "Stress hormone",
    category: :hormones
  },

  # Cancer Markers
  {
    name: "Prostate Specific Antigen",
    code: "PSA",
    unit: "ng/mL",
    reference_range: "<4.0 ng/mL",
    description: "Prostate cancer screening",
    category: :cancer
  },
  {
    name: "Carcinoembryonic Antigen",
    code: "CEA",
    unit: "ng/mL",
    reference_range: "<2.5 ng/mL (non-smoker), <5.0 ng/mL (smoker)",
    description: "Colorectal cancer marker",
    category: :cancer
  },

  # Autoimmune Markers
  {
    name: "Antinuclear Antibodies",
    code: "ANA",
    unit: "titer",
    reference_range: "<1:80",
    description: "General autoimmune screening",
    category: :autoimmune
  },
  {
    name: "Rheumatoid Factor",
    code: "RF",
    unit: "IU/mL",
    reference_range: "<14 IU/mL",
    description: "Rheumatoid arthritis marker",
    category: :autoimmune
  }
].each do |biomarker|
  Biomarker.create!(
    name: biomarker[:name],
    code: biomarker[:code],
    unit: biomarker[:unit],
    reference_range: biomarker[:reference_range],
    description: biomarker[:description],
    biomarker_category: categories[biomarker[:category]]
  )
end

puts "Created #{BiomarkerCategory.count} categories and #{Biomarker.count} biomarkers"

# Keep the user creation from before
User.create!(
  email: 'acetinick@gmail.com',
  password: 'password123',
  password_confirmation: 'password123'
) unless User.exists?(email: 'acetinick@gmail.com')

puts "Default user created: acetinick@gmail.com / password123"
