Rails.application.routes.draw do
  
   # deviseを使用するmodelの作成にて
  # いちよう記入した
  root to: 'homes#top'
  
  get 'home/about' => 'homes#about'

  
  devise_for :users
  
  # controllerファイルの作成
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update]
  
  
  # get 'users/show'
  # get 'users/edit'
  # get 'users/index'
  # 上記3つをまとめたのが↓
  resources :users, only:[:index, :show, :edit, :update]
  
  
  

end
