Rails.application.routes.draw do
  
    root to: 'visitors#index'


  resources :appointments
  resources :histories
  resources :presriptions
  resources :medicines
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    resources :comments
    resources :posts do 
      resources :comments, module: :posts
    end

    resources :conversations do
      member do
        post :reply
        post :trash
        post :untrash
      end
    end

  get '/contact', to: "pages#contact"

  get '/services', to: "pages#services"

  get '/about', to: "pages#about"

  get '/faq', to: "pages#faq"
  get '/index', to: "userpanel#index"
  get '/prescription', to: "userpanel#prescription"
  get '/account', to: "userpanel#account"
  get '/my_posts', to: "posts#my_questions"
  get '/patient_history', to: "userpanel#patient_history"
  get '/watch/:id', to: 'videos#watch', as: :watch
  get '/stream', to: 'videos#stream', as: :stream 
  get '/my_appointments', to: 'userpanel#my_appointments'
  get "mailbox/inbox" => "mailbox#inbox", as: :mailbox_inbox
  get "mailbox/sent" => "mailbox#sent", as: :mailbox_sent
  get "mailbox/trash" => "mailbox#trash", as: :mailbox_trash
  post '/ask_new_question', to: 'posts#new'
  
  devise_for :users ,controllers: {registrations: "registrations"}
  match ':controller(/:action(/:id))',:via => [:get,:post,:delete] 
  
  # as :user do
  #     get "/admins/register", to: "registrations#new", as: "register"
  # end

end
