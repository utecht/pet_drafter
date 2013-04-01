class GameController < ApplicationController
    def show
        @game = Game.find(params[:id])
        @user_pets = @game.game_pets.joins(:pet).where('pets.user_id = ?',  @game.user.id)
        @opponent_pets = @game.game_pets.joins(:pet).where('pets.user_id = ?',  @game.opponent.id)
    end
end
