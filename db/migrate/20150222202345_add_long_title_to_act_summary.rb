class AddLongTitleToActSummary < ActiveRecord::Migration
  def change
    add_column :act_summaries, :long_title, :text
  end
end
