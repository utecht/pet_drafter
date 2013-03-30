PetDrafter::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    root :to => "home#show"
    match '/update' => 'home#update'
    resources :characters
  end
end
