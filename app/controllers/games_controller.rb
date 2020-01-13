class GamesController < ApplicationController

    def index
        @games = Game.all
    end

    def create
        @game = Game.new(game_params)
        if @game.save
          flash[:success] = "Game successfully created"
          redirect_to @game
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def new
        @game = Game.new
    end
    
    def show
        @game = Game.find(params[:id])
    end
    
    def destroy
        @game = Game.find(params[:id])
        if @game.destroy
            flash[:success] = 'Object was successfully deleted.'
            redirect_to games_url
        else
            flash[:error] = 'Something went wrong'
            redirect_to games_url
        end
    end

    private 
        def game_params
            params.require(:game).permit(:name, :description, :min_player_count,
                :max_player_count, :publication_year, :deposit, :rental_price)
        end
end
