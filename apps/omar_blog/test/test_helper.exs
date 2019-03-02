ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(Omar.Db.Repo, :manual)

Omar.Blog.TestEndpoint.start_link([])
