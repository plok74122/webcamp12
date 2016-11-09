Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :attendees , :controller => :event_attendees
    resource :locations
    collection do
      post 'bulk_update'
    end
  end
end
