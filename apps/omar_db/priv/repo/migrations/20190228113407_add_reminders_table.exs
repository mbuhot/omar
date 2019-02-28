defmodule Omar.Db.Repo.Migrations.AddRemindersTable do
  use Ecto.Migration

  def change do
    execute(
      "CREATE SCHEMA omar_reminders",
      "DROP SCHEMA omar_reminders"
    )

    create table("reminders", prefix: "omar_reminders") do
      add :title, :string
      add :scheduled_for, :utc_datetime_usec
      timestamps()
    end
  end
end
