Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :attendees , :controller => :event_attendees
  end
  match ':controller(/:action(/:id(.:format)))', :via => :all
end
