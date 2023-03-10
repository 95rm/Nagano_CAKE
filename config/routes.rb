Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :admin do
    get ''=> 'homes#top'
    resources :items, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :orders_details, only: [:update]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'

    resources :items, only: [:index, :show]

      get '/customers/my_page' => 'customers#show'
      get '/customers/information/edit' => 'customers#edit'
      patch '/customers/information' => 'customers#update'
      get '/customers/stop' => 'customers#stop'
      patch '/customers/withdraw' => 'customers#withdraw'

    resources :cart_items, only: [:index, :create, :update, :destroy]do
     collection do
      delete :destroy_all
     end
    end

    resources :orders, only: [:new, :create, :index, :show]do
     collection do
      post :verification
      get :complete
     end
    end

    resources :address, only: [:index, :create, :edit, :update, :destroy]do
    end
  end

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


end
