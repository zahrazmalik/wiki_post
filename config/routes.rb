Rails.application.routes.draw do
  resources :wiki_posts
  namespace :wiki_posts do
    get "example", to: "wiki_posts#example"
  end

  namespace :welcome do
    get "index", to: "welcome#index"
    get "about", to: "welcome#about"
  end

  namespace :api do
    namespace :v1 do
      get "wiki_posts/xml", to: "wiki_posts#xml_index"
      get "wiki_posts/csv", to: "wiki_posts#csv_index"
      resources :wiki_posts
    end
    namespace :v2 do
      resources :wiki_posts
    end
  end



  get "/about", to: "welcome#about", as: :about
  get "welcome", to: "welcome#index"
  root "welcome#index"
end
