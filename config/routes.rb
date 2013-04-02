PetDrafter::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    root :to => "home#index"
    match '/update' => 'home#update'
    match '/teams/:id/:action/:pet_id' => 'teams'
    match '/lobbies/challenge/'
    match '/lobbies/accept/'
    match '/games/:id' => 'game#show'
    match '/games/:id/:action/:pet_id' => 'games'
    resources :characters, :teams, :lobbies
  end
end
