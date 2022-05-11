Rails.application.routes.draw do
  get 'users/new'
  root 'static_pages#home'
  #rootになると/が#になる
  #get 'static_pages/help'
  # Static_pages#helpと同じ
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #root 'application#hello'
  #get 'static_pages/home'
  #get 'static_pages/about'
  #get 'static_pages/contact'
  
  #Chapter5で書き換えた
  # /はパスを意味する。#は後ろがアクションであることを示す。
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',     to: 'users#new' 
  resources :users

end
