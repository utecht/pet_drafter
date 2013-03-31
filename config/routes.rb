PetDrafter::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    root :to => "home#show"
    match '/update' => 'home#update'
    match ':controller/:action/:id/:pet_id'
    match '/lobbies/challenge/'
    match '/lobbies/accept/'
    resources :characters, :teams, :lobbies
  end
end
