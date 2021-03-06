use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :tilex, TilexWeb.Endpoint,
  http: [port: 4001],
  server: true

config :tilex, :sql_sandbox, true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
if System.get_env("DATABASE_URL") do
  config :tilex, Tilex.Repo,
    adapter: Ecto.Adapters.Postgres,
    url: System.get_env("DATABASE_URL"),
    pool: Ecto.Adapters.SQL.Sandbox
else
  config :tilex, Tilex.Repo,
    adapter: Ecto.Adapters.Postgres,
    database: "tilex_test",
    hostname: "localhost",
    pool: Ecto.Adapters.SQL.Sandbox
end

config :tilex, :page_size, 5
config :tilex, :auth_controller, Test.AuthController
config :tilex, :slack_notifier, Test.Slack
config :tilex, :twitter_notifier, Test.Twitter
config :tilex, :organization_name, "Energized Work"
config :tilex, :canonical_domain, "https://til.energizedwork.com"
config :tilex, :default_twitter_handle, "energizedwork"

config :tilex, :async_feature_test, (System.get_env("ASYNC_FEATURE_TEST") == "yes")

config :httpoison, timeout: 6000

config :wallaby,
  # driver: Wallaby.Experimental.Chrome,
  hackney_options: [timeout: :infinity, recv_timeout: :infinity],
  # chrome: [
  #   headless: true
  # ],
  screenshot_on_failure: true
