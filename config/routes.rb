Rails.application.routes.draw do

  get 'profile/edit/:id', to: 'profile#edit', as: 'profile_edit'

  get 'profile/view/:id', to: 'profile#view', as: 'profile_view'

  get 'profile/list/:id', to: 'profile#list', as: 'profile_list'

  get '/search', to: 'search#search', as: 'search'

  devise_for :users, controllers: { registrations: 'registrations' }

  root to: 'public_site#index'

  get '/contact', to: 'public_site#contact'

  get '/about', to: 'public_site#about'

  get '/pricing', to: 'public_site#pricing'

  get '/demo', to: 'public_site#demo'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
