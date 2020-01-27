# CLI controller

class BabbelExplorer::CLI 

  def call 
    
    puts "Welcome to Babbel Explorer!"
    puts "To view country list, type 'explore'"
    puts "Type 'exit' to exit."
    input = gets.strip.downcase
    if input == 'exit'
      exit
    elsif input == 'explore'
      country_list
    else 
      puts "invalid command"
      call
    end
  end
  
  def country_list #lists countries
    @countries = ["albania", "bosnia", "serbia", "turkey"] #hardcoded for development 
    @countries.each_with_index do |country, i|
    #BabbelExplorer::Country.all.each_with_index do |country, i| FIX SCRAPER
      puts "#{i+1}. #{country}"
    end
    get_selection
  end
  
  def get_selection
    input = gets.strip 
    
    if input.to_i > 0 && input.to_i < @countries.size
      puts "#{@countries[input.to_i-1]}" # for now, return country, but later, call language
    else  
      puts "invalid selection"
    country_list
    end
  end
   
  def exit
    puts "Thank you for using Babbel Explorer!"
  end

end