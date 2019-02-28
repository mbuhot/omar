# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :omar_db, ecto_repos: [Omar.Db.Repo]

database =
  case Mix.env() do
    :dev -> "omar_dev"
    :test -> "omar_test"
    :prod -> "omar"
  end

config :omar_db, Omar.Db.Repo,
  database: database,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  port: "5432"
