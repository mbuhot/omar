alias Omar.Db

ExUnit.start()

Omar.Reminders.TestEndpoint.start_link([])

Ecto.Adapters.SQL.Sandbox.mode(Db.Repo, :manual)
