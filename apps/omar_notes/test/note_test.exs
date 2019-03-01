defmodule Omar.Notes.NoteTest do
  use ExUnit.Case, async: true
  alias Omar.Notes.Note
  alias Omar.Db

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Db.Repo)
  end

  test "Create valid note" do
    assert {:ok, note} = Note.create(title: "News", body: "Volcano Erupting")
    assert note.title == "News"
  end

  test "Note title is requried" do
    assert {:error, changeset} = Note.create(title: "", body: "Volcano Erupting")
    refute changeset.valid?
  end

  test "Note can be saved" do
    {:ok, note} = Note.create(title: "News", body: "Volcano Erupting")
    assert %Note{} = Db.Repo.insert!(note)
  end
end
