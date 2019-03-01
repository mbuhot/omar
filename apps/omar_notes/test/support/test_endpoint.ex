defmodule Omar.Notes.TestEndpoint do
  use Phoenix.Endpoint, otp_app: :omar_notes

  plug(Plug.Logger)
  plug(Plug.Parsers, parsers: [:json], pass: ["*/*"], json_decoder: Phoenix.json_library())
  plug(Omar.Notes.Router)
end
