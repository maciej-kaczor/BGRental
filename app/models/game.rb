class Game < ApplicationRecord
    has_one_attached :picture
    has_many :rentals

    validates :name, presence: { message: "Pole wymagane" }
    validates :deposit, numericality: { message: "Pole musi być liczbą" }
    validates :rental_price, numericality: { message: "Pole musi być liczbą" }
    validates :min_player_count, presence: { message: "Pole wymagane" }, numericality: { message: "Pole musi być liczbą" } 
    validates :max_player_count, presence: { message: "Pole wymagane" }, numericality: { message: "Pole musi być liczbą" }
    validates :publication_year, numericality: { message: "Pole musi być liczbą" }

    def rented?
        self.rentals.where(:returned => false).any?
    end

    def self.search(search)
        if search
          where("name LIKE ?", search)
        else
          all
        end
    end
end
