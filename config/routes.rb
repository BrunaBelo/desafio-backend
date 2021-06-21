Rails.application.routes.draw do
  root to: 'home#index'
  post 'import_csv', to: 'import#import_csv'
  resources :parliamentarians, only: %i[index show]
end
