class Bike < ApplicationRecord
    validates :brand, presence: true
    validates :wheels, presence: true
    validates :color, presence: true
    validates :year_of_production, presence: true

    def famous?
         ["Romet", "Trek", "Giant"].include?(@brand)
    end

    def kind_of_bike
        if @wheels == 2
          puts "1-sladowy"
        elsif @wheels == 4
          puts "2- sladowy"
        end
    end

    def is?(i)
        brand == i 
    end
 
end
  

  
  
 