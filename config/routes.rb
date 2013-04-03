PetDrafter::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    root :to => "home#index"
    match '/update' => 'home#update'
    match '/teams/:id/:action/:pet_id' => 'teams'
    match '/lobbies/challenge/'
    match '/lobbies/accept/'
    match '/games/:id' => 'game#show'
    match '/games/:id/ban_pet/:pet_id' => 'game#ban_pet'
    match '/games/:id/pick_pet/:pet_id' => 'game#pick_pet'
    match '/games/:id/destroy' => 'game#destroy'
    match '/games/:id/reset' => 'game#reset'
    resources :characters, :teams, :lobbies
  end
end
