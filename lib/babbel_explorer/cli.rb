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
  
  def country_list
    puts "these are the countries"   
  end

  def exit
    puts "Thank you for using Babbel Explorer!"
  end

end