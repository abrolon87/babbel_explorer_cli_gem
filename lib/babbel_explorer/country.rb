class BabbelExplorer::Country
  attr_accessor :name, :language 

  @@all = []
  
  def initialize(name, language)
    @name = name 
    @language = language
    @@all << self
  end

  def self.all
    BabbelExplorer::Scraper.scrape_countries
    @@all  #return all countries
  end
  
  def save 
    @@all << self
  end 

  
  # def self.create(name, language)
  #   country = self.new(name, language)
  #   country.save 
  #   country 
  # end

  
end