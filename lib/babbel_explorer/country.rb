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
    @@all  #return all countries
  end
  
  def save 
    @@all << self
  end 

  def self.create(name, language)
    country = self.new(name, language)
    country.save 
    country 
  end

  
end