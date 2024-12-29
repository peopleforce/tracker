class BiomarkerRecordsChange < ActiveRecord::Migration[8.0]
  def change
    execute("DELETE FROM biomarker_records")
    remove_column :biomarker_records, :biomarker_id
    add_column :biomarker_records, :user_biomarker_id, :integer
    remove_column :biomarker_records, :user_id
  end
end
