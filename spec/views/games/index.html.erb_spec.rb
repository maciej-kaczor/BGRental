require 'rails_helper'

RSpec.describe "games/index" do
  context "with 3 games" do
    before(:each) do
        assign(:games, [
            Game.create!(:name => "Game 1", :deposit => "0.0", :rental_price => "0.00", :min_player_count => "2", :max_player_count => "4", :publication_year => "2020"),
            Game.create!(:name => "Game 2", :deposit => "0.0", :rental_price => "0.00", :min_player_count => "2", :max_player_count => "4", :publication_year => "2020"),
            Game.create!(:name => "Game 3", :deposit => "0.0", :rental_price => "0.00", :min_player_count => "2", :max_player_count => "4", :publication_year => "2020")
        ])
    end

    it "displays all the games" do
      render

      expect(rendered).to match /Game 1/
      expect(rendered).to match /Game 2/
      expect(rendered).to match /Game 3/
    end
  end
end
