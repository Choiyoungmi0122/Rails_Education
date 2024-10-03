Rails.application.routes.draw do
  resources :articles do
    resources :comments, only: [:create]  # 댓글이 게시글에 종속되도록 설정
  end

  resources :class_statuses
  resources :class_lists
  devise_for :users
  resources :tests
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'articles#index'  # 현재는 articles#index로 설정
  # root 'class_lists#index'  # 나중에 주석 해제할 root
end
