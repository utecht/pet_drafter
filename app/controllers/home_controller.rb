class HomeController < Devise::SessionsController
  def show
    if user_signed_in?
      @character = Character.where('user_id' => current_user.id).first()
      @pets = Pet.where('user_id' => current_user.id)
    end
  end 

  def update
      if not user_signed_in?
          redirect_to('/')
          return false
      end
      @c = Character.where('user_id' => current_user.id).first()
      r = HTTParty.get("http://#{@c.region}.battle.net/api/wow/character/#{@c.server}/#{@c.name}?fields=pets")
      if r['reason'] != nil
          redirect_to('/', notice:r['reason'])
      end
      Pet.where('user_id' => current_user.id).destroy_all
      r['pets']['collected'].each do |p|
          pet = Pet.new
          pet.name = p['name']
          pet.level = p['stats']['level']
          pet.power = p['stats']['power']
          pet.health = p['stats']['health']
          pet.speciesId = p['creatureId']
          pet.speed = p['stats']['speed']
          pet.user_id = current_user.id
          pet.save
      end

      redirect_to('/', notice: 'Pets updated')
  end
end
