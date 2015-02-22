class AddActSummaryToAct < ActiveRecord::Migration
  def change
    add_reference :acts, :act_summary, index: true
    add_foreign_key :acts, :act_summaries
  end
end
