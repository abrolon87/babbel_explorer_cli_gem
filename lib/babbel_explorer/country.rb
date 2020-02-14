class BabbelExplorer::Country
  attr_reader :name, :language 

  @@all = []
  
  def initialize(name, language)
    @name = name 
    @language = language
    @@all << self
  end

  def self.all
    @@all  
  end
  
end