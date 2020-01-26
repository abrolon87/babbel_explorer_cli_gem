class BabbelExplorer::Country
  attr_accessor :name


  def self.all
    #return all countries
  end
  
  def self.scrape
    doc = Nokogiri::HTML(open(https://www.cia.gov))
    binding.pry
  end
end