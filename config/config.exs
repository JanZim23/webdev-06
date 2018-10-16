# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :task1,
  ecto_repos: [Task1.Repo]

# Configures the endpoint
config :task1, Task1Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xCUe4hR/cYZE9pMHDpoe7Sj265iGH8sOeFSM1HFCYxXJ4dXMOTMGN3O5F3a3MsYA",
  render_errors: [view: Task1Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Task1.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix and Ecto
config :phoenix, :json_library, Jason
config :ecto, :json_library, Jason


# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
