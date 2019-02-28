defmodule Omar.Db.Repo do
  use Ecto.Repo, otp_app: :omar_db, adapter: Ecto.Adapters.Postgres
end
