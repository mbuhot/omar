defmodule Omar.Blog.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:post) do
      add :title, :string
      add :body, :string
      add :published, :utc_datetime_usec

      timestamps()
    end
  end
end
