defmodule Omar.Web.Application do
  use Application

  def start(_type, _args) do
    children = [
      Omar.Web.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Omar.Web.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    Omar.Web.Endpoint.config_change(changed, removed)
    :ok
  end
end
