class Dog
    def initialize(name, breed, age, bark, favorite_foods)
        @name = name
        @breed = breed
        @age = age
        @bark = bark
        @favorite_foods = favorite_foods
    end

    def name
        @name
    end
    
    def breed
        @breed
    end

    def age
        @age
    end

    def age=(number)
        @age = number
    end

    def bark
        if @age > 3 # OR age > 3, using the getter method
            @bark.upcase
        else
            @bark.downcase
        end
    end

    def favorite_foods
        @favorite_foods
    end

    def favorite_food?(item)
        # favorite_foods.any? do |food|
        #     food.downcase == item.downcase
        # end
        favorite_foods.map(&:downcase).include?(item.downcase)
    end
end
