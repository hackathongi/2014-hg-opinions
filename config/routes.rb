HgOpinions::Application.routes.draw do
  root :to => 'opinions#index'
  get 'ecommerce/:ecommerce_id/opinions', :to => 'opinions#index', :as => "client_opinions"
  get 'fake-api', :to => 'opinions#fake_api'
end
