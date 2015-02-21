class CreateActSummaries < ActiveRecord::Migration
  def change
    create_table :act_summaries do |t|
      t.string :unique_id
      t.string :language
      t.string :link_to_xml
      t.string :link_to_html_toc
      t.string :title
      t.date :current_to_date

      t.timestamps null: false
    end
  end
end
