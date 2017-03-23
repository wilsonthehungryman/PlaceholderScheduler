Rails.application.routes.draw do
  get 'public_site/index'

  get 'public_site/contact'

  get 'public_site/about'

  get 'public_site/pricing'

  get 'public_site/demo'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
