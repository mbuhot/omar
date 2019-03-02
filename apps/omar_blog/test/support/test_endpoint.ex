defmodule Omar.Blog.TestEndpoint do
  use Phoenix.Endpoint, otp_app: :omar_blog

  plug(Plug.RequestId)
  plug(Plug.Logger)

  plug(Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()
  )

  plug(Plug.Session,
    store: :cookie,
    key: "_omar_blog_key",
    signing_salt: "DM9E9aNJ"
  )

  plug(Omar.Blog.Router)
end
