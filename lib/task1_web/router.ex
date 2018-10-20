defmodule Task1Web.Router do
  use Task1Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Task1Web.Plugs.FetchLogin
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Task1Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/user", UserController
    resources "/task", TaskController
    get "/mytasks", TaskController, :index_for_user
    post "/login", PageController, :login
    get "/logout", PageController, :logout
    get "/register", UserController, :register
  end

  # Other scopes may use custom stacks.
  # scope "/api", Task1Web do
  #   pipe_through :api
  # end
end
