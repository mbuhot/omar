defmodule Omar.Blog.Router do
  use Phoenix.Router

  pipeline :browser do
    plug Plug.Static,
      at: "/blog",
      from: :omar_blog,
      gzip: false,
      only: ~w(css fonts images js favicon.ico robots.txt)

    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/blog", Omar.Blog do
    pipe_through :browser

    get "/", PageController, :index
    get "/*rest", PageController, :redirect_to_index
  end
end
