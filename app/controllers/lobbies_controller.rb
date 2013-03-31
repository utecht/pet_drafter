class LobbiesController < ApplicationController
  # GET /lobbies
  # GET /lobbies.json
  def index
    @lobbies = Lobby.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lobbies }
    end
  end

  # GET /lobbies/1
  # GET /lobbies/1.json
  def show
    @lobby = Lobby.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lobby }
    end
  end

  # GET /lobbies/new
  # GET /lobbies/new.json
  def new
    @lobby = Lobby.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lobby }
    end
  end

  # GET /lobbies/1/edit
  def edit
    @lobby = Lobby.find(params[:id])
  end

  # POST /lobbies
  # POST /lobbies.json
  def create
    @lobby = Lobby.new(params[:lobby])

    respond_to do |format|
      if @lobby.save
        format.html { redirect_to @lobby, notice: 'Lobby was successfully created.' }
        format.json { render json: @lobby, status: :created, location: @lobby }
      else
        format.html { render action: "new" }
        format.json { render json: @lobby.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lobbies/1
  # PUT /lobbies/1.json
  def update
    @lobby = Lobby.find(params[:id])

    respond_to do |format|
      if @lobby.update_attributes(params[:lobby])
        format.html { redirect_to @lobby, notice: 'Lobby was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lobby.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lobbies/1
  # DELETE /lobbies/1.json
  def destroy
    @lobby = Lobby.find(params[:id])
    @lobby.destroy

    respond_to do |format|
      format.html { redirect_to lobbies_url }
      format.json { head :no_content }
    end
  end
end
