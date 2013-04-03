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
        @user_pets = @game.game_pets.joins(:pet).where('pets.user_id = ?', @game.user.id)
        @opponent_pets = @game.game_pets.joins(:pet).where('pets.user_id = ?',@game.opponent.id)
        @waiting = {0 => "#{@game.user.email} ban",
          1 => "#{@game.opponent.email} ban",
          2 => "#{@game.user.email} pick",
          3 => "#{@game.opponent.email} pick",
          4 => "#{@game.opponent.email} ban",
          5 => "#{@game.user.email} ban",
          6 => "#{@game.opponent.email} pick",
          7 => "#{@game.user.email} pick",
          8 => "#{@game.user.email} ban",
          9 => "#{@game.opponent.email} ban",
          10 => "#{@game.user.email} pick",
          11 => "#{@game.opponent.email} pick"}
    end

    def ban_pet
      @game = Game.find(params[:id])
      @pet = Pet.find(params[:pet_id])
      game_pet = GamePet.where('game_id = ?', @game.id).where('pet_id = ?', @pet.id).first
      game_pet.status = -1
      game_pet.save
      @game.stage = @game.stage + 1
      @game.save
      redirect_to @game
    end

    def pick_pet
      @game = Game.find(params[:id])
      @pet = Pet.find(params[:pet_id])
      game_pet = GamePet.where('game_id = ?', @game.id).where('pet_id = ?', @pet.id).first
      game_pet.status = 1
      game_pet.save
      @game.stage = @game.stage + 1
      @game.save
      redirect_to @game
    end

    def destroy
      @game = Game.find(params[:id])
      lobby = Lobby.where(:user => @game.user).first
      pets = GamePet.where('game_id = ?', @game.id).destroy_all
      @game.destroy
      lobby.opponent = nil
      lobby.team = nil
      lobby.challengetime = nil
      lobby.save
      redirect_to '/lobbies', :notice => 'Game Ended'
    end
end
