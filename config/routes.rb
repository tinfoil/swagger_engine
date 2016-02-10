SwaggerEngine::Engine.routes.draw do
  resources :swaggers, only: [:index, :show]
  get 'swaggers/o2c.html', to: 'swaggers#o2c'
  root to: 'swaggers#index'
end
