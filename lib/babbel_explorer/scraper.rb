class BabbelExplorer::Scraper
  
  def self.scrape_countries 
    doc = Nokogiri::HTML(open("https://www.cia.gov/the-world-factbook/countries/") )
    
    #countries = doc.css("table#fieldListing tr")
    countries = doc.css("div#index-content-section.container.pv120-90")
    binding.pry
    countries.each do |country|
      name = country.css("div.col-lg-9.col-md12.col-sm-12").text.strip
      binding.pry
      puts name
      # name = country.css("td.country").text.strip
      # language = country.css("div.category_data.subfield.text").text
      
      BabbelExplorer::Country.new(name, language)
    end
  end      
end




