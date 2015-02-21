class CreateRegulations < ActiveRecord::Migration
  def change
    create_table :regulations do |t|
      t.integer :olid
      t.string :unique_id
      t.string :language
      t.string :link_to_xml
      t.string :link_to_html_to_toc
      t.string :title
      t.date :current_to_date

      t.timestamps null: false
    end
  end
end
