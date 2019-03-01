defmodule Omar.Notes.CreatePlugTest do
  use Omar.Notes.ConnCase, async: true
  alias Omar.Notes

  test "Create a note through the API", %{conn: conn} do
    body = %{
      title: "News",
      body: "Volcano is erupting"
    }

    conn =
      conn
      |> put_req_header("accept", "application/json")
      |> post(Routes.notes_path(conn, :create), body)

    response = json_response(conn, 201)
    assert %{"title" => "News"} = response
  end

  test "Delete a note through the API", %{conn: conn} do
    {:ok, note} =
      Notes.create_note(%{
        title: "News",
        body: "Volcano erupting"
      })

    conn =
      conn
      |> put_req_header("accept", "application/json")
      |> delete(Routes.notes_path(conn, :delete, note.id))

    assert conn.status == 200
  end
end
