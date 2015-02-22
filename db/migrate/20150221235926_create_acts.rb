class CreateActs < ActiveRecord::Migration
  def change
    create_table :acts do |t|
      t.string :creator
      t.date :issued
      t.date :modified
      t.string :subject
      t.text :raw_html
      t.text :html

      t.timestamps null: false
    end
  end
end
