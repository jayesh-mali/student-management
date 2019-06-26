Rails.application.routes.draw do
  resources :students
  resources :semesters
  # resources :users

  # resources :users do
  #   member do
  #     put 'activate_organization'
  #     get 'orders_list'
  #     put 'generate_invoice'
  #   end
  #   collection do
  #     get 'active_months'
  #     put 'send_report'
  #     put 'send_organization_report'
  #     get 'search_active_organization'
  #   end
  # end

  post 'login', to: 'sessions#authenticate'
  post 'signup', to: 'users#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
