Rails.application.routes.draw do
  resources :links do
    resources :comments
  end

  post 'up_vote/:id' => 'links#up_vote', as: "up_vote"
  post 'down_vote/:id' => 'links#down_vote', as: "down_vote"
end
