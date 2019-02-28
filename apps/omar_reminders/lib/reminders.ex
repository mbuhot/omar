defmodule Omar.Reminders do
  @moduledoc "Public API For the Omar.Reminders application"

  alias Omar.Reminders.Reminder
  alias Omar.Db

  def create_reminder(params) do
    with {:ok, reminder} <- Reminder.create(params),
         {:ok, inserted} <- Db.Repo.insert(reminder) do
      {:ok, Map.from_struct(inserted)}
    end
  end

  def delete_reminder(id) do
    query =
      Reminder
      |> Reminder.with_id(id)
    {n, _} = Db.Repo.delete_all(query)
    case n do
      1 -> :ok
      0 -> {:error, "Reminder with id: #{id} not found"}
    end
  end
end
