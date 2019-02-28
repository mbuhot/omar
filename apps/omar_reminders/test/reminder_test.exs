defmodule Omar.Reminders.ReminderTest do
  use ExUnit.Case, async: true
  alias Omar.Reminders.Reminder
  alias Omar.Db

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Db.Repo)
  end

  test "Create valid reminder" do
    assert {:ok, reminder} = Reminder.create(title: "By Milk", scheduled_for: "2019-04-01T00:00:00.000000Z")
    assert reminder.title == "By Milk"
  end

  test "Reminder title is requried" do
    assert {:error, changeset} = Reminder.create(title: "", scheduled_for: "2019-04-01T00:00:00.000000Z")
    refute changeset.valid?
  end

  test "Reminder can be saved" do
    {:ok, reminder} = Reminder.create(title: "By Milk", scheduled_for: "2019-04-01T00:00:00.000000Z")
    assert %Reminder{} = Db.Repo.insert!(reminder)
  end
end
