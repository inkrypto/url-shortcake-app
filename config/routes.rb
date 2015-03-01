Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do
     authenticated :user do
       root 'links#index', as: :authenticated_root
     end

     unauthenticated do
       root 'devise/registrations#new', as: :unauthenticated_root
     end
   end

  resources :links
  resources :visits

  get '/:slug' => 'visits#create'
  
  # links     GET   /links          links#index
  #           POST  /links          links#create
  # new_link  GET   /links/new      links#new
  # edit_link GET   /links/:id/edit links#edit
  # link      GET   /links/:id      links#show
  #           PATCH /links/:id      links#update
  #           PUT   /links/:id      links#update
  #           DELETE /links/:id     links#destroy  

end
