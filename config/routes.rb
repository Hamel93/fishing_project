Rails.application.routes.draw do
  root "assistant#index"
  get "/assistant", to: "assistant#index"
end
