class BabbelExplorer::Country
  attr_accessor :name, :language 

  @@all = []
  
  def initialize(name, language)
    @name = name 
    @language = language
    #@@all << self
    save
  end

  def self.all
    BabbelExplorer::Scraper.scrape_countries if @@all.empty?
    @@all  #return all countries
  end
  
  def save 
    @@all << self
  end 

  def clear_all 
    @@all.clear 
  end

end