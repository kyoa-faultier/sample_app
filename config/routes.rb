Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/help'
  # Static_pages#helpと同じ
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'application#hello'
  
  get 'static_pages/about'

end
