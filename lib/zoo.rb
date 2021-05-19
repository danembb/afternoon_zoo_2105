class Zoo
  attr_reader :street,
              :city,
              :state,
              :zip_code,
              :inventory

  def initialize(street, city, state, zip_code)
    @street = street
    @city = city
    @state = state
    @zip_code = zip_code
    @inventory = []
  end

  def address
    @street + " " + @city + ", " + @state + " " + @zip_code
  end

  def animal_count
    @inventory.count
  end

  def add_animal(new_animal)
    @inventory << new_animal
  end

  def animals_older_than(age_check)
    @inventory.find_all do |animals|
      if animals.age.to_i >= age_check

      end
    end
  end
end
