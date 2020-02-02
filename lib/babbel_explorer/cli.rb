# CLI controller

class BabbelExplorer::CLI 

  def call 
    puts "\nWelcome to Babbel Explorer!\n".cyan.bold
    explore 
  end 
  
  def explore
    puts "\nTo view country list, type 'explore'\n".green
    puts "Type 'exit' at anytime to exit.".green
    
    input = gets.strip.downcase
    if input == 'exit'
      exit
    elsif input == 'explore'
      get_countries
      country_list
      get_selection
    else 
      invalid_input
    end
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
    puts "\nScroll to view countries\n".yellow.bold
  end
  
  def get_selection
    chosen_country = gets.strip.to_i
    if valid_input(chosen_country, @countries)
      show_lang_blurb(chosen_country)
    else  
      invalid_input
    end
  end
    
  def invalid_input 
    puts "\nInvalid Command!\n".red.bold
    call
  end

  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

  def show_lang_blurb(chosen_country)
    country = @countries[chosen_country]
    #language = country.language
    puts "\nLanguages spoken in #{country.name}:\n".magenta.bold
    puts "#{country.language}".magenta
    country.clear_all
    explore 
  end

  def exit
    puts "\nThank you for using Babbel Explorer!\n".cyan.bold
  end

end