class CreateBiomarkerRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :biomarker_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :biomarker, null: false, foreign_key: true
      t.decimal :value
      t.datetime :recorded_at
      t.text :notes

      t.timestamps
    end
  end
end
