class BabbelExplorer::Scraper
  
  def self.scrape_countries 
    doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/402.html")) 
    
    countries = doc.css("table#fieldListing tr")

    countries.each do |country|
      name = country.css("td.country").text.strip
      language = country.css("div.category_data.subfield.text").text
       
      BabbelExplorer::Country.new(name, language)
    end
  end

#   def self.scrape_languages
#     doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/402.html")) 
    
#     countries = doc.css("table#fieldListing tr")

#     countries.each do |country|
#       #name = country.css("td.country").text.strip
#       language = country.css("div.category_data.subfield.text").text
      
end

   