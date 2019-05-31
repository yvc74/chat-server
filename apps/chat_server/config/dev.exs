use Mix.Config

# Do not include metadata in development logs
config :logger, :console, format: "$time [$level] $message\n"

config :chat_server, ChatServer.Repo,
  adapter: Ecto.Adapters.Postgres,
  hostname: System.get_env("CHAT_SERVER_POSTGRES_HOST"),
  username: System.get_env("CHAT_SERVER_POSTGRES_USER"),
  password: System.get_env("CHAT_SERVER_POSTGRES_PASS"),
  database: System.get_env("CHAT_SERVER_POSTGRES_DB"),
  pool: Ecto.Adapters.SQL.Sandbox
  pool_size: 10
