# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :wedding_day,
  ecto_repos: [WeddingDay.Repo]

# Configures the endpoint
config :wedding_day, WeddingDay.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+8MawY6Pt6oqdIWpuuL6QrYBoFY49JDvLF5V6dXKzpWlZcF7T7UUq9hZ87W+qcAh",
  render_errors: [view: WeddingDay.ErrorView, accepts: ~w(html json)],
  pubsub: [name: WeddingDay.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
