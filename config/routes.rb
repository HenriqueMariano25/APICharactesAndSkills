Rails.application.routes.draw do
  namespace 'v1' do
    resources :characters do
      resources :skills, only:[:index,:update,:create,:destroy]
    end
    root :to => "characters#index"
  end
end
