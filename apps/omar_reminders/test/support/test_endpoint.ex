defmodule Omar.Reminders.TestEndpoint do
  use Phoenix.Endpoint, otp_app: :omar_reminders

  plug(Plug.Logger)
  plug(Plug.Parsers, parsers: [:json], pass: ["*/*"], json_decoder: Phoenix.json_library())
  plug(Omar.Reminders.Router)
end
