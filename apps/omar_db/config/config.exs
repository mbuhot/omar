# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

config :omar_db, ecto_repos: [Omar.Db.Repo]

db_opts =
  case Mix.env() do
    :dev -> [database: "omar_dev"]
    :test -> [database: "omar_test", pool: Ecto.Adapters.SQL.Sandbox]
    :prod -> [database: "omar"]
  end

config :omar_db,
       Omar.Db.Repo,
       db_opts ++
         [
           username: "postgres",
           password: "postgres",
           hostname: "localhost",
           port: "5432",
           migration_primary_key: [name: :id, type: :binary_id],
           migration_timestamps: [type: :utc_datetime_usec]
         ]
