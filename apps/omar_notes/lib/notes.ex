defmodule Omar.Notes do
  @moduledoc "Public API For the Omar.Notes application"

  alias Omar.Notes.Note
  alias Omar.Db

  def create_note(params) do
    with {:ok, note} <- Note.create(params),
         {:ok, inserted} <- Db.Repo.insert(note) do
      {:ok, Note.to_map(inserted)}
    end
  end

  def delete_note(id) do
    query =
      Note
      |> Note.with_id(id)

    {n, _} = Db.Repo.delete_all(query)

    case n do
      1 -> :ok
      0 -> {:error, "Note with id: #{id} not found"}
    end
  end
end
