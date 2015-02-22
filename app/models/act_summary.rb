class ActSummary < ActiveRecord::Base
  has_many :regulations
  has_one :act

  def link_to_previous_versions
    link_to_html_toc.sub(/index\.html/, "PITIndex.html")
  end

  def link_to_html
    if language == "eng"
      link_to_html_toc.sub(/index\.html/, "FullText.html")
    else
      link_to_html_toc.sub(/index\.html/, "TexteComplet.html")
    end
  end
end
