class RenameRegulationLinkToHtmlToTocColumn < ActiveRecord::Migration
  def up
    rename_column :regulations, :link_to_html_to_toc, :link_to_html_toc
  end
  def down
    rename_column :regulations, :link_to_html_toc, :link_to_html_to_toc
  end
end
