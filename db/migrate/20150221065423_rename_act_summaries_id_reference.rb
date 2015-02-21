class RenameActSummariesIdReference < ActiveRecord::Migration
  def up
    rename_column :regulations, :act_summaries_id, :act_summary_id
  end
  def down
    rename_column :regulations, :act_summary_id, :act_summaries_id
  end
end
