defmodule Omar.Reminders.HealthPlug do
  @behaviour Plug

  def init(_opts), do: []

  def call(conn, _opts) do
    conn
    |> Plug.Conn.resp(200, "Reminders OK")
  end
end
