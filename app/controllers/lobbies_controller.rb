class LobbiesController < ApplicationController
  # GET /lobbies
  # GET /lobbies.json
  def index
    if current_user.lobby
        l = current_user.lobby
        l.time = Time.now
        l.save
    else
        l = Lobby.new
        l.user = current_user
        l.save
    end
    @lobbies = Lobby.where("user_id != ?", current_user)
    @challenges = Lobby.where("opponent_id = ?", current_user)
    @pending_games = Lobby.where("user_id = ?", current_user).where("opponent_id is not null")
    @accepted_games = Lobby.where("user_id = ?", current_user).where("accepted is true")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lobbies }
    end
  end

  def challenge
      lobby = Lobby.find(params[:id])
      lobby.opponent = params[:opponentId]
      lobby.team = params[:teamId]
      lobby.challengetime = Time.now
      lobby.save
      redirect_to "/lobbies", :notice => "#{lobby.opponent.email} Challenged"
  end
end
