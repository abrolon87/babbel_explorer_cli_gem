# CLI controller

class BabbelExplorer::CLI 

  def call 
    puts "Welcome to Babbel Explorer!"
    explore 
  end 
  
  def explore
    puts "To view country list, type 'explore'"
    puts "Type 'exit' to exit."
    
    input = gets.strip.downcase
    if input == 'exit'
      exit
    elsif input == 'explore'
      get_countries
      country_list
      get_selection
    else 
      puts "invalid command"
      call
    end
  end
  
  def get_countries
    @countries = BabbelExplorer::Country.all
  end

  def country_list #lists countries 
    
    puts "Choose a country by its corresponding number"
    @countries.each.with_index(1) do |country, index|
      puts  "#{index}. #{country.name}"
    end
  end
  
  def get_selection
    chosen_country = gets.strip.to_i
    show_lang_blurb(chosen_country) if valid_input(chosen_country, @countries)
  end
  
  def valid_input(input, data)
    input.to_i <= data.length && input.to_i > 0
    #   show_lang_blurb
    # else  
    #   puts "invalid selection. Please try again."    
    #   country_list
    # end
  end

  def show_lang_blurb(chosen_country)
    country = @countries[chosen_country - 1]
    language = country.language
    puts "Languages spoken in #{country.name}:"
    puts "#{country.language}"
    explore 
  end

   
  def exit
    puts "Thank you for using Babbel Explorer!"
  end

end