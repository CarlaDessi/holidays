Rails.application.routes.draw do
  get 'admin/index'
  root :to => "home#index"
  resources :users
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
end
