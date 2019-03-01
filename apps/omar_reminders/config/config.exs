# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config

if Mix.env() == :test do
  config :omar_reminders, Omar.Reminders.TestEndpoint,
    secret_key_base: "WID17gA+vkaqjlf87CCaXqxA5xgWGFAsaO1tkhQEVpRI0TUKdoHJE4gsYrhBTUoW",
    url: [host: "localhost"],
    http: [port: 4002],
    server: false
end
