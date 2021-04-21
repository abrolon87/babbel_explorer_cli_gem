class BabbelExplorer::Scraper
  
  def self.scrape_countries 
    doc = Nokogiri::HTML(URI.open("https://www.factmonster.com/world/countries/languages-by-countries"))
    
    doc.css('.sgmltable tr').each do |l|

      name = l.children[0].text
      language = l.children[1].text
        
      BabbelExplorer::Country.new(name, language)
    end
  end      
end
