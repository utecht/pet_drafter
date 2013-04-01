class LobbiesController < ApplicationController
  # GET /lobbies
  # GET /lobbies.json
  def index
    if current_user.lobby
        l = current_user.lobby
        l.time = Time.now
        l.accepted = false
        l.save
    else
        l = Lobby.new
        l.user = current_user
        l.accepted = false
        l.save
    end
    @lobbies = Lobby.where("user_id != ?", current_user)
    @challenges = Lobby.where("opponent_id = ?", current_user)
    @pending_games = Lobby.where("user_id = ?", current_user).where("opponent_id is not null").where(:accepted => false)
    @accepted_games = Lobby.where("user_id = ? or opponent_id = ?", current_user, current_user).where(:accepted => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lobbies }
    end
  end

  def challenge
      lobby = Lobby.find(params[:id])
      lobby.opponent = User.find(params[:opponentId])
      lobby.team = Team.find(params[:team]['id'])
      lobby.challengetime = Time.now
      lobby.save
      redirect_to "/lobbies", :notice => "#{lobby.opponent.email} Challenged"
  end

  def accept
      lobby = Lobby.find(params[:id])
      if params[:commit] == 'Reject' or params[:commit] == 'Cancel'
          lobby.opponent = nil
          lobby.team = nil
          lobby.challengetime = nil
          lobby.save
          redirect_to '/lobbies', :notice => 'Game rejected'
          return false
      end
      lobby.accepted = true
      @game = Game.new
      @game.user = lobby.user
      @game.team = lobby.team
      @game.opponent = lobby.opponent
      @game.opponent_team = Team.find(params[:team]['id'])
      @game.stage = 0
      @game.save
      lobby.game = @game
      lobby.save
      @game.team.pets.each do |p|
          g = GamePet.new
          g.game = @game
          g.pet = p
          g.status = 0
          g.save
      end
      @game.opponent_team.pets.each do |p|
          g = GamePet.new
          g.game = @game
          g.pet = p
          g.status = 0
          g.save
      end
      redirect_to "/games/#{@game.id}"
  end
end
