A CLI app that shows a list of countries and users can choose a country to see the languages spoken in that country.

Flow
User types babbel_explorer

Display list of countries

"Choose a country by its corresponding number"

user sees languages spoken in chosen country
<!-- countries.each.with_index(1) do |country, i|
  puts "#{i}. #{country}
   -->

Classes
  country 
  language
  region(?maybe in a later version?)
  scraper

  #    
#     page = "https://www.cia.gov/library/publications/the-world-factbook/fields/402.html"
#     doc = Nokogiri::HTML(open(page))
#     doc.css("section.reference_content table tr")
    

# # #get country 
# # countries.each_with_index do |c|
# #   puts c.css("td.country").text.strip
#   end
  
#     doc = Nokogiri::HTML(open("https://www.cia.gov/library/publications/the-world-factbook/fields/402.html"))
# # get language
#     doc.css("table#fieldListing tr, td div#field-languages, div.category_data")
        
# # puts languages
#     end
# #get language
# # languages = doc.css("table#fieldListing tr, td div#field-languages, div.category_data.subfield.text")

# # languages.each do |l|
# #   puts l.css("td div#field-languages, div.category_data subfield text").text.strip
#   end