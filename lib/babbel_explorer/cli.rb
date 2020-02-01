# CLI controller

class BabbelExplorer::CLI 

  def call 
    puts "\nWelcome to Babbel Explorer!\n"
    explore 
  end 
  
  def explore
    puts "\nTo view country list, type 'explore'\n"
    puts "Type 'exit' at anytime to exit."
    
    input = gets.strip.downcase
    if input == 'exit'
      exit
    elsif input == 'explore'
      get_countries
      country_list
      get_selection
    else 
      puts "\nInvalid Command!\n"
      call
    end
  end
  
  def get_countries
    @countries = BabbelExplorer::Country.all 
  end

  def country_list #lists countries 
    
    puts "\nChoose a country by its corresponding number\n"
    puts "\n"
    @countries.each_with_index do |country, index|
      if index == 0 
        nil 
      else 
      puts "#{index}. #{country.name}" 
      end
    end
    
  end
  
  def get_selection
    chosen_country = gets.strip.to_i
    show_lang_blurb(chosen_country) if valid_input(chosen_country, @countries)
  end
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
  end

  def show_lang_blurb(chosen_country)
    country = @countries[chosen_country]
    #language = country.language
    puts "\nLanguages spoken in #{country.name}:\n"
    puts "#{country.language}"
    country.clear_all
    explore 
  end

  def exit
    puts "\nThank you for using Babbel Explorer!\n"
  end

end