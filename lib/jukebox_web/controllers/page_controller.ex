defmodule JukeboxWeb.PageController do
  use JukeboxWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
