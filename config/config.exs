use Mix.Config

# By default, the umbrella project as well as each child
# application will require this configuration file, as
# configuration and dependencies are shared in an umbrella
# project. While one could configure all applications here,
# we prefer to keep the configuration of each individual
# child application in their own app, but all other
# dependencies, regardless if they belong to one or multiple
# apps, should be configured in the umbrella to avoid confusion.
import_config "../apps/*/config/config.exs"

config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

case Mix.env() do
  :dev ->
    config :phoenix, :plug_init_mode, :runtime
  :test ->
    config :logger, level: :warn
  :prod ->
    config :logger, level: :info
end

