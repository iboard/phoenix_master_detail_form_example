# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :jukebox,
  ecto_repos: [Jukebox.Repo]

# Configures the endpoint
config :jukebox, JukeboxWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "2P3BXadWrsFbyHg62QevIaBP910s1uC2NVEM+PKRCPPWFUZWlGotHRu8aZr77WVz",
  render_errors: [view: JukeboxWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Jukebox.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
