class GameController < ApplicationController
  # Stages
  # 0 - user ban
  # 1 - opponent ban
  # 2 - user pick
  # 3 - opponent pick
  # 4 - opponent ban
  # 5 - user ban
  # 6 - opponent pick
  # 7 - user pick
  # 8 - user ban
  # 9 - opponent ban
  # 10 - user pick
  # 11 - opponent pick
    def show
        @game = Game.find(params[:id])
        @user_pets = @game.game_pets.joins(:pet).where('pets.user_id = ?',  @game.user.id)
        @opponent_pets = @game.game_pets.joins(:pet).where('pets.user_id = ?',  @game.opponent.id)
    end

    def ban_pet

    end

    def pick_pet

    end
end
