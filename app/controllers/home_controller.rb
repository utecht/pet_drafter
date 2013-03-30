class HomeController < Devise::SessionsController
  def show
    if user_signed_in?
      @character = current_user.character
      @pets = current_user.pets
    end
  end 

  def update
      if not user_signed_in?
          redirect_to('/')
          return false
      end
      @c = current_user.character
      r = HTTParty.get("http://#{@c.region}.battle.net/api/wow/character/#{@c.server}/#{@c.name}?fields=pets")
      if r['reason'] != nil
          redirect_to('/', notice:r['reason'])
      end
      current_user.pets.destroy_all
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
