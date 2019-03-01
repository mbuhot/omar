defmodule Omar.Notes.CreatePlug do
  @behaviour Plug
  alias Plug.Conn

  def init(_opts), do: []

  def call(conn, _opts) do
    case Omar.Notes.create_note(conn.params) do
      {:ok, note} ->
        conn
        |> Conn.put_resp_content_type("application/json")
        |> Conn.resp(201, Jason.encode!(note))

      {:error, changes} ->
        conn
        |> Conn.put_resp_content_type("application/json")
        |> Conn.resp(422, Jason.encode!(changes.errors))
    end
  end
end
