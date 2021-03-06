Rails.application.routes.draw do
  devise_for :admins, skip: :all
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'login', to: 'admin#login'
  get 'admin', to: 'admin#show'
  get 'logout', to: 'admin#logout'
  get 'authentication_failure', to: 'application#authentication_failure', as: :authentication_failure
  put 'authentication_failure', to: 'application#authentication_failure'
  delete 'authentication_failure', to: 'application#authentication_failure'
  namespace 'api' do
    namespace 'v1' do
      scope 'teachers' do
        get 'index', to: 'teachers#index'
        get 'show/:id', to: 'teachers#show'
        post 'create', to: 'teachers#create'
        put 'update/:id', to: 'teachers#update'
        delete 'delete/:id', to: 'teachers#delete'
        get 'my_students/:id', to: 'teachers#my_students'
      end
      scope 'students' do
        get 'index', to: 'students#index'
        get 'show/:id', to: 'students#show'
        post 'create', to: 'students#create'
        put 'update/:id', to: 'students#update'
        delete 'delete/:id', to: 'students#delete'
      end
      scope 'languages' do
        get 'index', to: 'languages#index'
        get 'show/:id', to: 'languages#show'
        post 'create', to: 'languages#create'
        delete 'delete/:id', to: 'languages#delete'
      end
    end
  end
end
