class HomeController < Devise::SessionsController
  def show
    if user_signed_in?
      @character = Character.where('user_id' => current_user.id)
    end
  end 

  def new
    @character = Character.new
    puts 'huh'
  end

  def create
    @character = Character.new(params[:post])
    if @character.save
      redirect_to(:home)
    end
  end
end
