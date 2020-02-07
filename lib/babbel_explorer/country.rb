class BabbelExplorer::Country
  attr_accessor :name, :language 

  @@all = []
  
  def initialize(name, language)
    @name = name 
    @language = language
    save
  end

  def self.all
    BabbelExplorer::Scraper.scrape_countries if @@all.empty?
    @@all  
  end
  
  def save 
    @@all << self
  end 
  
end