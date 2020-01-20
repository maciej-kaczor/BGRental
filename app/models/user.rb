class User < ApplicationRecord
    has_one :permission
    has_one :role, through: :permission
    has_many :rentals

    has_secure_password

    validates :username, presence: { message: "Pole wymagane"}, uniqueness: { message: "Istnieje użytkownik o takiej nazwie" }
    validates :email, presence: { message: "Pole wymagane"}, uniqueness: { message: "Istnieje użytkownik o takiej nazwie" }

    def role?(check_role)
        role.name == check_role
    end
end
