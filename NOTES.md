A CLI app that shows a list of countries and users can choose a country to see the languages spoken in that country.

Flow
User types babbel_explorer

Display list of countries

"Choose a country by its corresponding number"

user sees languages spoken in chosen country
<!-- countries.each.with_index do |country, i|
  puts "#{i}. #{country}
   -->

Classes
  country 
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


Refactoring cli.rb

get_countries
country_list
get_selection
explore_more


skteches:

create into hash?
{:name => "name", :language => "language"}

check for valid input
<!-- def valid_input(input, data)
  input.to_i <= data.length && input.to_i > 0
end -->

# def get_countries
  #   countries = BabbelExplorer::Scraper.scrape_countries
  #   countries.shift
  #   if BabbelExplorer::Country.all.empty?
  #     countries.each do |country|
  #       BabbelExplorer::Country.new(country[:name], country[:language])
  #     end
  #   end
  #     #@countries = BabbelExplorer::Country.all 
  # end

 # def explore
  #   input = ""
  #   until input == "exit"
  #     get_countries
  #     country_list
  #     get_selection
  #   end                 #i want a confirmation message to the user before exiting 
  #   exit 
  # end