defmodule Omar.Db.Repo.Migrations.AddBlogPostsTable do
  use Ecto.Migration

  def change do
    execute(
      "CREATE SCHEMA omar_blog",
      "DROP SCHEMA omar_blog"
    )

    create table("posts", prefix: "omar_blog") do
      add(:body, :string)
      add(:published, :utc_datetime_usec)
      add(:title, :string)
      timestamps()
    end
  end
end
