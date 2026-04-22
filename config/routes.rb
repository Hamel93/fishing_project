Rails.application.routes.draw do
  root "assistant#index"
  post "/assistant", to: "assistant#create"
end
