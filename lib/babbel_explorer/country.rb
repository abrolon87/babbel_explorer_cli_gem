class BabbelExplorer::Country
  attr_accessor :name

  @@all = []

  # def initialize(name)
  #   self.name = name 
  #   #self.languages = []
  #   save
  # end

  def self.all
    @@all#return all countries
  end
  
  def save 
    @@all << self
  end 

  def self.create(name)
    country = self.new(name) 
    save
  end
end