Rails.application.routes.draw do
  root("pastes#index")
  get("/list", to: "pastes#list")
  get("/new", to: "pastes#new")
  post("/new", to: "pastes#create")
  get("/paste/:id", to: "pastes#show")
  get("/paste/:id/raw", to: "pastes#raw")
end
