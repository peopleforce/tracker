class CreateBiomarkers < ActiveRecord::Migration[8.0]
  def change
    create_table :biomarkers do |t|
      t.string :name
      t.string :code
      t.string :unit
      t.string :reference_range
      t.text :description
      t.references :biomarker_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
