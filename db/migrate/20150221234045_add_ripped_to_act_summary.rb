class AddRippedToActSummary < ActiveRecord::Migration
  def change
    add_column :act_summaries, :ripped, :bool
  end
end
