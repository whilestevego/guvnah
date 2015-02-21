class Regulation < ActiveRecord::Base
  belongs_to :act_summary

  def link_to_previous_versions
    link_to_html_toc.sub(/index\.html/, "PITIndex.html")
  end

  def link_to_html
    link_to_html_toc.sub(/index\.html/, "FullText.html")
  end
end
