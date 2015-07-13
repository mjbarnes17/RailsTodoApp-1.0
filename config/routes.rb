Rails.application.routes.draw do
  
  # sets views/listings/index.html.erb as the root of the website
  root 'listings#index'
  
  # create all the routes neeeded for listings (C.R.U.D.)
  resources :listings

end
