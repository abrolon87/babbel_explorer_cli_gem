# CLI controller

class BabbelExplorer::CLI 

  def call 
    
    puts "Welcome to Babbel Explorer!"
    puts "To view country list, type 'explore'"
    puts "Type 'exit' to exit."
    get_countries
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
  
  def get_countries
    #BabbelExplorer::Country.new("russia") 
    @countries = BabbelExplorer::Country.all
  end

  def country_list #lists countries 
    
    @countries = BabbelExplorer::Country.all #["albania", "bosnia", "serbia", "turkey"] hardcoded for development 
    
    BabbelExplorer::Country.all.each.with_index(1) do |country, index|
      
      puts "#{index}. #{country.name}"
    end
    get_selection
  end
  
  def get_selection
    input = gets.strip 
    
    if input.to_i > 0 && input.to_i < @countries.size
      puts "#{country.language}"
      puts "language coming soon"
    else  
      puts "invalid selection. Please try again."
    country_list
    end
  end
   
  def exit
    puts "Thank you for using Babbel Explorer!"
  end

end