defmodule Omar.Web.RouterTest do
  use Omar.Web.ConnCase, async: true

  test "forwards reminders requests", %{conn: conn} do
    conn =
      conn
      |> get("/reminders/health")

    assert conn.status == 200
    assert conn.resp_body =~ "Reminders OK"
  end

  test "forwards notes requests", %{conn: conn} do
    conn =
      conn
      |> get("/notes/health")

    assert conn.status == 200
    assert conn.resp_body =~ "Notes OK"
  end
end
