class User < ApplicationRecord
    has_one :permission
    has_one :role, through: :permission

    has_secure_password

    validates :username, presence: { message: "Pole wymagane"}, uniqueness: { message: "Istnieje użytkownik o takiej nazwie" }
    validates :email, presence: { message: "Pole wymagane"}, uniqueness: { message: "Istnieje użytkownik o takiej nazwie" }

    def role?(role)
        roles.any? { |r| r.name.underscore.to_sym == role } 
    end
end
