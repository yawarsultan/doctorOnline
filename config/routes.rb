Rails.application.routes.draw do
  resources :medicines
  	root to: 'visitors#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :comments
    resources :posts do 
      resources :comments, module: :posts
    end

  get '/contact', to: "pages#contact"

  get '/services', to: "pages#services"

  get '/about', to: "pages#about"

  get '/faq', to: "pages#faq"
  get '/index', to: "userpanel#index"
  get '/my_posts', to: "posts#my_questions"
  get '/watch/:id', to: 'videos#watch', as: :watch
  get '/stream', to: 'videos#stream', as: :stream

  post '/ask_new_question', to: 'posts#new'
  
  devise_for :users , controllers: {registrations: "registrations"}
  match ':controller(/:action(/:id))',:via => [:get,:post,:delete]

end
