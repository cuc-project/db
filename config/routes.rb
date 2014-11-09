Rails.application.routes.draw do
  root to: "search#index"

  get "/search", to: "search#search"
end
