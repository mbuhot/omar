defmodule Omar.Reminders.CreatePlug do
  @behaviour Plug
  alias Plug.Conn

  def init(_opts), do: []

  def call(conn, _opts) do
    case Omar.Reminders.create_reminder(conn.params) do
      {:ok, reminder} ->
        conn
        |> Conn.put_resp_content_type("application/json")
        |> Conn.resp(201, Jason.encode!(reminder))
      {:error, changes} ->
        conn
        |> Conn.put_resp_content_type("application/json")
        |> Conn.resp(422, Jason.encode!(changes.errors))
    end
  end
end
