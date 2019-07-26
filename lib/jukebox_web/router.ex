defmodule JukeboxWeb.Router do
  use JukeboxWeb, :router

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

  scope "/", JukeboxWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/albums", AlbumController
    get "/track/:id", AlbumController, :delete_track
  end

  # Other scopes may use custom stacks.
  # scope "/api", JukeboxWeb do
  #   pipe_through :api
  # end
end
