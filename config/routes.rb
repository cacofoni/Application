Rails.application.routes.draw do

  post 'feedbacks' => 'feedbacks#create', :as => :feedback
  get 'feedbacks/new' => 'feedbacks#new', :as => :new_feedback
  get '/comments/:id', to: 'comments#show', :as => :comment
  
  root to: 'rooms#show'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
