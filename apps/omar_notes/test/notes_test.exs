defmodule Omar.Notes.NotesTest do
  use ExUnit.Case, async: true
  alias Omar.Notes
  alias Omar.Notes.Note
  alias Omar.Db

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Db.Repo)
  end

  test "Save a note to the database" do
    assert {:ok, note} = Notes.create_note(title: "News", body: "Volcano Erupting")
    assert %Note{title: "News"} = Db.Repo.get!(Note, note.id)
  end

  test "Delete a note from the database" do
    assert {:ok, note} =
             Notes.create_note(
               title: "News",
               body: "Volcano Erupting"
             )

    assert :ok = Notes.delete_note(note.id)
    assert nil == Db.Repo.get(Note, note.id)
  end
end
