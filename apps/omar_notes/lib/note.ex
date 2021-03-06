defmodule Omar.Notes.Note do
  use Ecto.Schema
  alias Ecto.Changeset
  alias __MODULE__

  @schema_prefix :omar_notes
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @timestamps_opts [type: :utc_datetime_usec]

  schema "notes" do
    field(:title, :string)
    field(:body, :string)
    timestamps()
  end

  @type t :: %__MODULE__{
          title: String.t(),
          body: String.t(),
          inserted_at: DateTime.t(),
          updated_at: DateTime.t()
        }

  @spec create(Enumerable.t()) :: {:ok, t} | {:error, Changeset.t()}
  def create(params) do
    changeset =
      %__MODULE__{}
      |> Changeset.cast(Map.new(params), [:title, :body])
      |> Changeset.validate_length(:title, max: 64)
      |> Changeset.validate_length(:body, max: 1024)
      |> Changeset.validate_required([:title, :body])

    if changeset.valid? do
      {:ok, Ecto.Changeset.apply_changes(changeset)}
    else
      {:error, changeset}
    end
  end

  def to_map(note = %Note{}) do
    note
    |> Map.from_struct()
    |> Map.delete(:__meta__)
  end

  def with_id(queryable, id) do
    import Ecto.Query

    from(r in queryable,
      where: r.id == ^id,
      select: r
    )
  end
end
