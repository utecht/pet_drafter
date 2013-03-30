PetDrafter::Application.routes.draw do
  resources :teams

  devise_for :users

  devise_scope :user do
    root :to => "home#show"
    match '/update' => 'home#update'
    resources :characters, :teams
  end
end
