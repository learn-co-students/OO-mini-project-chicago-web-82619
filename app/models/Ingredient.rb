class Ingredient
  attr_reader :name
  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end
  
  def self.most_common_allergen
    frequency_tbl = Hash.new(0)
    Allergy.all.each {|allergy| frequency_tbl[allergy.ingredient] += 1} 
    frequency_tbl.keys.sort_by {|allergen| frequency_tbl[allergen]}[-1]
  end

  def self.all
    @@all
  end
end
