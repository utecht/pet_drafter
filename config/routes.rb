PetDrafter::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    root :to => "home#show"
    match '/update' => 'home#update'
    match ':controller/:action/:id/:pet_id'
    match '/lobbies/challenge/:id/:opponentId/:teamId'
    resources :characters, :teams, :lobbies
  end
end
