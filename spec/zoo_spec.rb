require 'rspec'
require './lib/animal'
require './lib/zoo'

RSpec.describe Zoo do
  describe 'instantiation' do
    it '::new' do
      #I'm not sure why bronx zoo is here. It seems completely unnecessary... Is this intentional?
      zoo = Zoo.new("2300 Southern Blvd", "Bronx", "NY", "10460")

      expect(zoo).to be_an_instance_of(Zoo)
    end

    it 'can have attributes' do
      zoo = Zoo.new("2300 Southern Blvd", "Bronx", "NY", "10460")

      expect(zoo.street).to eq("2300 Southern Blvd")
      expect(zoo.city).to eq("Bronx")
      expect(zoo.state).to eq("NY")
      expect(zoo.zip_code).to eq("10460")
    end
  end

  describe '#methods' do
    it '#can have an address' do
      zoo = Zoo.new("2300 Southern Blvd", "Bronx", "NY", "10460")

      expect(zoo.address).to eq("2300 Southern Blvd Bronx, NY 10460")
    end

    it '#can have an inventory of animals' do
      zoo = Zoo.new("2300 Southern Blvd", "Bronx", "NY", "10460")

      expect(zoo.inventory).to eq([])
    end

    it '#can count the animals in inventory' do
      zoo = Zoo.new("2300 Southern Blvd", "Bronx", "NY", "10460")

      expect(zoo.animal_count).to eq(0)
    end

    it '#can add animals' do
      zoo = Zoo.new("2300 Southern Blvd", "Bronx", "NY", "10460")
      animal_1 = Animal.new("Sea Otter", 10, 25)
      animal_2 = Animal.new("Red Panda", 5, 70)
      zoo.add_animal(animal_1)
      zoo.add_animal(animal_2)

      expect(zoo.inventory).to eq([animal_1, animal_2])
      expect(zoo.animal_count).to eq(2)
    end

    it '#can sort animals by age' do
      zoo = Zoo.new("2300 Southern Blvd", "Bronx", "NY", "10460")
      animal_1 = Animal.new("Sea Otter", 10, 25)
      animal_2 = Animal.new("Red Panda", 5, 70)
      animal_3 = Animal.new("Capybara", 100, 150)
      animal_4 = Animal.new("Dolphin", 150, 200)
      zoo.add_animal(animal_1)
      zoo.add_animal(animal_2)
      zoo.add_animal(animal_3)
      zoo.add_animal(animal_4)

      expect(zoo.animals_older_than(250)).to eq([])
      expect(zoo.animals_older_than(100)).to eq([animal_3, animal_4])
      expect(zoo.animals_older_than(10)).to eq([animal_1, animal_3, animal_4])
    end
    #
    # it '#can find total weight of animals' do
    #   zoo = Zoo.new("2300 Southern Blvd", "Bronx", "NY", "10460")
    #   animal_1 = Animal.new("Sea Otter", 10, 25)
    #   animal_2 = Animal.new("Red Panda", 5, 70)
    #   animal_3 = Animal.new("Capybara", 100, 150)
    #   animal_4 = Animal.new("Dolphin", 150, 200)
    #   zoo.add_animal(animal_1)
    #   zoo.add_animal(animal_2)
    #   zoo.add_animal(animal_3)
    #   zoo.add_animal(animal_4)
    #
    #   expect(zoo.total_weight_of_animals).to eq(265)
    # end
  end
end
