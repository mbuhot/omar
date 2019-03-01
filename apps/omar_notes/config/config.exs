use Mix.Config

if Mix.env() == :test do
  config :omar_notes, Omar.Notes.TestEndpoint,
    secret_key_base: "WID17gA+vkaqjlf87CCaXqxA5xgWGFAsaO1tkhQEVpRI0TUKdoHJE4gsYrhBTUoW",
    url: [host: "localhost"],
    http: [port: 4002],
    server: false
end
