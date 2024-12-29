class CreateUserBiomarkers < ActiveRecord::Migration[8.0]
  def change
    create_table :user_biomarkers do |t|
      t.references :user, null: false, foreign_key: true
      t.references :biomarker, null: false, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
