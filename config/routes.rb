PetDrafter::Application.routes.draw do
  devise_for :users

  devise_scope :user do
    root :to => "home#show"
    match "new_char" => "home#new"
  end
end
