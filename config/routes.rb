PetDrafter::Application.routes.draw do
  resources :teams

  devise_for :users

  devise_scope :user do
    root :to => "home#show"
    match '/update' => 'home#update'
    match ':controller/:action/:id/:pet_id'
    resources :characters, :teams
  end
end
