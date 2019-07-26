defmodule Jukebox.Repo do
  use Ecto.Repo,
    otp_app: :jukebox,
    adapter: Ecto.Adapters.Postgres
end
