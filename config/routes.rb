HgOpinions::Application.routes.draw do
  root :to => 'opinions#index'
  get 'ecommerce/:ecommerce_id/opinions', :to => 'opinions#index'
  get 'fake-api', :to => 'opinions#fake_api'
end
