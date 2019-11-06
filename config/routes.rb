Rails.application.routes.draw do
  namespace 'v1' do
    resources :characters do
      resources :skills
    end
    root :to => "characters#index"
  end
end
