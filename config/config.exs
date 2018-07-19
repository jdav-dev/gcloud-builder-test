# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :gitlab_ci_test,
  ecto_repos: [GitlabCiTest.Repo]

# Configures the endpoint
config :gitlab_ci_test, GitlabCiTestWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bFXMUpGM02umO32WpHsAiVJLW6sRzu5S+BDJLXetyJNB2f7BREPlRsKx0u2o7Z0B",
  render_errors: [view: GitlabCiTestWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GitlabCiTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
