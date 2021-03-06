class GamesController < ApplicationController
    PAGE_SIZE = 10

    load_and_authorize_resource
    
    def index
        @page = (params[:page] || 0).to_i
        @all_games = Game.search(params[:search])
        @games_size = @all_games.size
        @games = @all_games.offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
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

    def edit
        @game = Game.find(params[:id])
    end

    def update
        @game = Game.find(params[:id])
        if @game.update_attributes(game_params)
          redirect_to @game
        else
          render 'edit'
        end
    end

    private 
        def game_params
            params.require(:game).permit(:name, :description, :min_player_count,
                :max_player_count, :publication_year, :deposit, :rental_price, :picture)
        end

        def show_next_page?
            @page = (params[:page] || 0).to_i + 1
            @games_count = Game.all.size
            @page * PAGE_SIZE < @games_count
        end
        helper_method :show_next_page?
end
