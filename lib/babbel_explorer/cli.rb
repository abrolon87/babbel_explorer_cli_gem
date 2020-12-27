# CLI controller
class BabbelExplorer::CLI 
  
  def call 
    puts "\nWelcome to Babbel Explorer!\n".cyan.bold
    menu
  end 
  
  def menu 
    puts "\nTo view country list, type 'explore'\n".green
    puts "Type 'exit' to exit.".green
    input = gets.strip
    case input.downcase 
      when "explore"
        explore
      when "exit"
        exit
      else 
        invalid_input 
    end
  end 
  
  def explore
    get_countries
    country_list
    get_selection
    explore_more
  end

  def get_countries
    BabbelExplorer::Scraper.scrape_countries if BabbelExplorer::Country.all.empty?
  end
  
  def country_list  
    puts "\nChoose a country by its corresponding number or type 'q' to quit".yellow.bold
    puts "\nScroll down to view countries\n".yellow
    puts "\n"
    
    BabbelExplorer::Country.all.each_with_index do |country, index|
      if index == 0 
        nil 
      else 
        puts "#{index}. #{country.name}".yellow
      end
    end
    puts "\nScroll up to view countries\n".yellow
  end
  
  def get_selection
    chosen_country = gets.strip
    max_countries = BabbelExplorer::Country.all.length - 1
    
    if chosen_country.to_i == 238 
      puts "\nThere are more than 7,000 languages spoken in the world. Try selecting a specific country:\n".red
      get_selection
    elsif chosen_country.to_i > 0 && chosen_country.to_i <= max_countries 
      chosen_country = chosen_country.to_i 
      show_lang_blurb(chosen_country)
    elsif chosen_country == 'q'             
      explore_more
    else  
      puts "Invalid command! Please try again.".red.bold
      get_selection
    end
  end
  
  def invalid_input 
    puts "\nInvalid Command!".red.bold
    puts "Please try again\n".red
    menu
  end

  def show_lang_blurb(chosen_country)
    countries = BabbelExplorer::Country.all
    country = countries[chosen_country]
    puts "\nLanguages spoken in #{country.name}:".magenta.bold
    puts "#{country.language}".magenta
    puts "Select another country from the list or type 'q' to quit.".yellow
    get_selection
  end 
  
  def explore_more
    puts "All done exploring for now? Hit any key to view country list again or type 'exit' to exit.".red
    input = gets.strip.downcase 
    if input == 'exit'
      exit
    else 
      explore
    end
  end  
  
  def exit
    puts "\nThank you for using Babbel Explorer!\n".cyan.bold
    abort 
  end
  
end