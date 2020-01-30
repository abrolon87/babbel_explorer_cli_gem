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

site = "https://www.cia.gov/library/publications/the-world-factbook/fields/402.html"
#THIS WORKS!
page = Nokogiri::HTML(open(site))
countries = page.css("table#fieldListing tr")
scraped_countries = []

countries.each do |c|
  country_name = c.css("td.country").text.strip
  lang = c.css("div.category_data.subfield.text").text
  
  puts country_name 
  puts lang 

end