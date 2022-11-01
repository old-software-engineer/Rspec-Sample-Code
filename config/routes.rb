# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'blogs/index'
      get 'blogs/:id', to: 'blogs#show'
      patch 'blogs/:id', to: 'blogs#update'
      post 'blogs/create', to: 'blogs#create'
      delete 'blogs/:id', to: 'blogs#destroy'
    end
  end

  root 'blogs#index'
end
