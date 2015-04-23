Chartism::Engine.routes.draw do
  resources :charts, only: [:show]
end
