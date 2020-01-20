class RentalsController < ApplicationController

    def new
        @game = Game.find(params[:game_id])
        @users_array = User.all.map { |user| [user.username, user.id] }
    end

    def create
        @game = Game.find(params[:game_id])
        if @game.rented?
            flash[:error] = "Gra jest już wypożyczona"
            redirect_to root_url
        else
            @rental = @game.rentals.create(rental_params)
            @rental.rent_date = Date.today
            @rental.returned = false
            if @rental.save
                redirect_to root_url
            else
                flash[:error] = "Something went wrong"
                render 'new'
            end
        end
    end

    def return
        @rental = Rental.find(params[:id])
        @rental.return_date = Date.today
        @rental.returned = true
        @rental.save
        redirect_to root_url
    end

    def index
        authorize! :index, Rental
        if can? :manage, Rental
            @rentals = Rental.all
        else
            @rentals = Rental.where(:user_id => session[:user_id])
        end
    end

    def return
        authorize! :manage, Rental
        @game = Game.find(params[:game_id])
        @rental = @game.rentals.where(:returned => false).first
        @rental.return_date = Date.today
        @rental.returned = true
        @rental.save
        redirect_to root_url
    end

    private
    def rental_params
        params.permit(:game_id, :user_id)
    end
end
