class RentalsController < ApplicationController

    def new
        @rental = Rental.new(params[:game_id])
    end

    def create
        @rental = Rental.new(rental_params)
        @rental.rent_date = Date.today
        @rental.returned = false
        if @rental.save
            redirect_to root_url
        else
            flash[:error] = "Something went wrong"
            render 'new'
        end
    end

    def return
        @rental = Rental.find(params[:id])
        @rental.return_date = Date.today
        @rental.returned = true
        @rental.save
        redirect_to root_url
    end

    private
    def rental_params
        params.require(:rental).permit(:game_id, :user_id)
    end
end
