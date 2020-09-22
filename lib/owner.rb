
class Owner
  attr_accessor 
  attr_reader :name, :species

  @@all = []

  def initialize(name, species = "human")
    @name = name 
    @species = species
    @@all << self 
  end 

  def say_species
    "I am a human."
  end 

  def self.all 
    @@all 
  end 

  def self.count 
   @@all.size 
  end 

  def self.reset_all 
    @@all.clear 
  end 

  def cats 
    Cat.all.select{|cats|cats.owner == self}
  end 

  def dogs 
    Dog.all.select{|dog|dog.owner == self}
  end 

  def buy_cat(name)
    Cat.new(name, self)
  end 

  def buy_dog(name)
    Dog.new(name, self)
  end 

  def walk_dogs 
    Dog.all.map{|dog|dog.mood = "happy"}
  end 

  def feed_cats 
    Cat.all.map{|cat|cat.mood = "happy"}
  end 

  def sell_pets
    pets = self.dogs + self.cats 
    pets.map{|pet| pet.mood = "nervous"} && pets.map{|pet| pet.owner = nil}
  end 

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end 
end