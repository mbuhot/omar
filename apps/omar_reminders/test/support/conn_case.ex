defmodule Omar.Reminders.ConnCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Phoenix.ConnTest
      alias Omar.Reminders.Router.Helpers, as: Routes

      # The default endpoint for testing
      @endpoint Omar.Reminders.TestEndpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Omar.Db.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Omar.Db.Repo, {:shared, self()})
    end

    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
