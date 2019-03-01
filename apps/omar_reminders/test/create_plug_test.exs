defmodule Omar.Reminders.CreatePlugTest do
  use Omar.Reminders.ConnCase, async: true
  alias Omar.Reminders

  test "Create a reminder through the API", %{conn: conn} do
    body = %{
      title: "Wake Up",
      scheduled_for: "2019-03-01T06:00:00.000000Z"
    }

    conn =
      conn
      |> put_req_header("accept", "application/json")
      |> post(Routes.reminders_path(conn, :create), body)

    response = json_response(conn, 201)
    assert %{"title" => "Wake Up"} = response
  end

  test "Delete a reminder through the API", %{conn: conn} do
    {:ok, reminder} =
      Reminders.create_reminder(%{
        title: "Wake Up",
        scheduled_for: "2019-03-01T06:00:00.000000Z"
      })

    conn =
      conn
      |> put_req_header("accept", "application/json")
      |> delete(Routes.reminders_path(conn, :delete, reminder.id))

    assert conn.status == 200
  end
end
