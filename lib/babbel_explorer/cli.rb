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
    input = ""
    unless input == "q"
      get_countries
      country_list
      get_selection
    end 
    explore_more
  end


  # def explore
  #   input = ""
  #   until input == "exit"
  #     get_countries
  #     country_list
  #     get_selection
  #   end 
  #   exit 
  # end
 
  def get_countries
    # @countries = BabbelExplorer::Scraper.scrape_countries
    # countries
    # if BabbelExplorer::Country.all.empty?
    #   countries.each do |country|
        
    #     BabbelExplorer::Country.new(country[:name], country[:language])
    #   end
    # end
    @countries = BabbelExplorer::Country.all 
    
  end
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

  def country_list  
    puts "\nChoose a country by its corresponding number or type 'q' to quit".yellow.bold
    puts "\nScroll down to view countries\n".yellow
    puts "\n"
    @countries.each_with_index do |country, index|
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

    if chosen_country.to_i.between?(1, 241) #> 0 && chosen_country.to_i <= @countries.length
      chosen_country = chosen_country.to_i 
      show_lang_blurb(chosen_country)
    elsif chosen_country == 'q' #|| 'exit'
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

  # def valid_input(input, data)
  #   input.to_i <= data.length && input.to_i > 0
  # end

  def show_lang_blurb(chosen_country)
    country = @countries[chosen_country]
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