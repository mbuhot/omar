use Mix.Config

config :omar_web, Omar.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WID17gA+vkaqjlf87CCaXqxA5xgWGFAsaO1tkhQEVpRI0TUKdoHJE4gsYrhBTUoW",
  render_errors: [view: Omar.Web.ErrorView, accepts: ~w(json)]

case Mix.env() do
  :dev ->
    config :omar_web, Omar.Web.Endpoint,
      http: [port: 4000],
      debug_errors: true,
      code_reloader: true,
      check_origin: false,
      watchers: []

  :test ->
    config :omar_web, Omar.Web.Endpoint,
      http: [port: 4002],
      server: false

  :prod ->
    config :omar_web, Omar.Web.Endpoint,
      server: true,
      http: [:inet6, port: 4000],
      url: [host: "example.com", port: 80],
      cache_static_manifest: "priv/static/cache_manifest.json"
end
