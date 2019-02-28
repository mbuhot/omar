defmodule Omar.Reminders.RemindersTest do
  use ExUnit.Case, async: true
  alias Omar.Reminders
  alias Omar.Reminders.Reminder
  alias Omar.Db

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Db.Repo)
  end

  test "Save a reminder to the database" do
    assert {:ok, reminder} = Reminders.create_reminder(title: "By Milk", scheduled_for: "2019-04-01T00:00:00.000000Z")
    assert %Reminder{} = Db.Repo.get!(Reminder, reminder.id)
  end

  test "Delete a reminder from the database" do
    assert {:ok, reminder} = Reminders.create_reminder(title: "By Milk", scheduled_for: "2019-04-01T00:00:00.000000Z")
    assert :ok = Reminders.delete_reminder(reminder.id)
    assert nil == Db.Repo.get(Reminder, reminder.id)
  end
end
