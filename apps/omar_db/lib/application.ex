defmodule Omar.Db.Application do
  use Application

  def start(_type, _args) do
    children = [
      Omar.Db.Repo
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
