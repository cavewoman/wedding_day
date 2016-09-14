defmodule WeddingDay.Router do
  use WeddingDay.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", WeddingDay do
    pipe_through :browser

    get "/instagram", AuthController, :request
    get "/instagram/callback", AuthController, :callback
  end

  scope "/", WeddingDay do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/posts", PostController
    resources "/todos", TodoController
    resources "/menu_items", MenuItemController
    get "instagram_endpoint", InstagramSubscriptionController, :instagram_sub_verfication
    post "instagram_endpoint", InstagramSubscriptionController, :user_instagram_posts
    get "subscribe_to_instagram", InstagramSubscriptionController, :instagram_sub_request
  end

  # Other scopes may use custom stacks.
  # scope "/api", WeddingDay do
  #   pipe_through :api
  # end
end
