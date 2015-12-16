Rails.application.routes.draw do

  root 'user/home#index'
  namespace :user do
  get 'home/index'
  end


  get 'admin' => 'admin/home#index'
  namespace :admin do
    get 'home/index'
    delete 'sites/:ids/destroy' => 'sites#batch_destroy'
    delete 'users/:ids/destroy' => 'users#batch_destroy'
    delete 'categories/:ids/destroy' => 'categories#batch_destroy'
    get 'login' => 'session#new'
    post 'login' => 'session#create'
    post 'logout' => 'session#destroy'
    resources :users
    resources :categories
    resources :sites
  end
  mount RuCaptcha::Engine => "/rucaptcha"
end
