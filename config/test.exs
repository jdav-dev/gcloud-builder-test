use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :gitlab_ci_test, GitlabCiTestWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :gitlab_ci_test, GitlabCiTest.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "gitlab_ci_test_test",
  hostname: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox
