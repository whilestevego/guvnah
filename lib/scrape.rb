require 'open-uri'
require 'nokogiri'

#f = File.open("#{Rails.root.to_s}/dump/Legis.xml")
#@doc = Nokogiri::XML(f) do |config|
#  config.options = Nokogiri::XML::ParseOptions::NOBLANKS
#end
#f.close

def run_regulation
  @doc.css('Regulation').each do |element|
    reg = Regulation.new
    reg.id = element.attr('id').to_i
    reg.olid = element.attr('olid').to_i

    reg.unique_id        = element.css("UniqueId").text
    reg.language         = element.css("Language").text
    reg.link_to_xml      = element.css("LinkToXML").text
    reg.link_to_html_toc = element.css("LinkToHTMLToC").text
    reg.title            = element.css("Title").text
    reg.current_to_date  = element.css("CurrentToDate").text

    reg.save
  end
end

def run_act_summaries
  @doc.css('Act').each do |element|
    act = ActSummary.new

    act.unique_id        = element.css("UniqueId").text
    act.language         = element.css("Language").text
    act.link_to_xml      = element.css("LinkToXML").text
    act.link_to_html_toc = element.css("LinkToHTMLToC").text
    act.title            = element.css("Title").text
    act.current_to_date  = element.css("CurrentToDate").text

    element.css('RegsMadeUnderAct').children.each do |child|
      act.regulations << Regulation.find(child.attr('idRef').to_i)
    end
    
    act.save
  end
end

def run_acts
  ActSummary.where(language:"eng").where(ripped: nil).limit(100).each do |act_summary|
    @html = Nokogiri::HTML(open(act_summary.link_to_html))

    act = Act.new

    act.creator = @html.css("meta").css("[name='dcterms.creator']").attr('content')
    act.issued = @html.css("meta").css("[name='dcterms.issued']").attr('content').value
    act.modified = @html.css("meta").css("[name='dcterms.modified']").attr('content').value
    act.subject = @html.css("meta").css("[name='dcterms.subject']").attr('content')
    act.raw_html = @html.css(".docContents > div").inner_html

    act.act_summary = act_summary
    act_summary.update(ripped: true) if act.save!
  end
end


