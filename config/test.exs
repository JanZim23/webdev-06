use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :task1, Task1Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :task1, Task1.Repo,
  username: "task",
  password: "ohl7Ughei4ie",
  database: "task1_dev",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
