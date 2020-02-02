# CLI controller

class BabbelExplorer::CLI 

  def call 
    puts "\nWelcome to Babbel Explorer!\n".cyan.bold
    explore 
  end 
  
  def explore
    puts "\nScroll down to view country list\n".green
    #puts "\nTo view country list, type 'explore'\n".green
    puts "Type 'exit' to exit.".green
    @input = ""
    until @input == "exit"
      
    #elsif input == 'explore'
      get_countries
      country_list
      get_selection
      #explore_more
    end 
    exit 
  end
  
  def get_countries
    @countries = BabbelExplorer::Country.all 
  end

  def country_list #lists countries 
    puts "\nChoose a country by its corresponding number\n".yellow
    puts "\n"
    @countries.each_with_index do |country, index|
      if index == 0 
        nil 
      else 
      puts "#{index}. #{country.name}" .yellow
      end
    end
    puts "\nScroll up to view countries\n".yellow.bold
  end
  
  def get_selection
    chosen_country = gets.strip.to_i
    if valid_input(chosen_country, @countries)
      show_lang_blurb(chosen_country)
    # elsif !valid_input(chosen_country, @countries)
    #   invalid_input unless chosen_country == "exit"
    else
      explore_more
    end
  end
  
  # def invalid_input 
  #   puts "\nInvalid Command!".red.bold
  #   puts "Please try again\n".red
  # end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

  def show_lang_blurb(chosen_country)
    country = @countries[chosen_country]
    puts "\nLanguages spoken in #{country.name}:".magenta.bold
    puts "#{country.language}".magenta
    #country.clear_all
    puts "Select another country from the list or type 'q' to quit.".yellow
    get_selection
  end 
  
  def explore_more
    puts "All done exploring for now? Hit any key to view country list again or type 'exit' to exit.".yellow
    @input = gets.strip.downcase 
  end  
  
  def exit
    puts "\nThank you for using Babbel Explorer!\n".cyan.bold
  end

end