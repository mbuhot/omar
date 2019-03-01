alias Omar.Db

ExUnit.start()

Omar.Notes.TestEndpoint.start_link([])

Ecto.Adapters.SQL.Sandbox.mode(Db.Repo, :manual)
