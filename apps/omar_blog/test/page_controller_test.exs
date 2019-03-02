defmodule Omar.Blog.PageControllerTest do
  use Omar.Blog.ConnCase

  test "GET /blog/", %{conn: conn} do
    conn = get(conn, "/blog/")
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end
end
