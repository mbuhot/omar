defmodule Omar.Reminders.DeletePlug do
  @behaviour Plug
  alias Plug.Conn

  def init(_opts), do: []

  def call(conn, _opts) do
    id = conn.params["id"]

    case Omar.Reminders.delete_reminder(id) do
      :ok ->
        conn
        |> Conn.put_resp_content_type("application/json")
        |> Conn.resp(200, "")
      {:error, message} ->
        conn
        |> Conn.put_resp_content_type("application/json")
        |> Conn.resp(422, Jason.encode!(%{error: message}))
    end
  end
end
