defmodule Omar.Db.Repo.Migrations.AddNotesTable do
  use Ecto.Migration

  def change do
    execute(
      "CREATE SCHEMA omar_notes",
      "DROP SCHEMA omar_notes"
    )

    create table("notes", prefix: "omar_notes") do
      add(:title, :string)
      add(:body, :string)
      timestamps()
    end
  end
end
