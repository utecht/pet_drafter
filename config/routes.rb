PetDrafter::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    root :to => "home#index"
    match '/update' => 'home#update'
    match ':controller/:action/:id/:pet_id'
    match '/lobbies/challenge/'
    match '/lobbies/accept/'
    match '/games/:id' => 'game#show'
    match '/games/:id/:action/:pet_id'
    resources :characters, :teams, :lobbies
  end
end
