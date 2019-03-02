defmodule Omar.Blog.PageController do
  use Phoenix.Controller, namespace: Omar.Blog
  alias Omar.Blog.Router.Helpers, as: Routes

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def redirect_to_index(conn, _params) do
    redirect(conn, to: Routes.page_path(conn, :index))
  end
end
