defmodule DbTest do
  use ExUnit.Case, async: true

  test "Omar DB can execute SQL" do
    assert %{rows: [[1]]} = Ecto.Adapters.SQL.query!(Omar.Db.Repo, "SELECT 1")
  end
end
