defmodule Omar.Blog.Post do
  use Ecto.Schema
  import Ecto.Changeset

  @schema_prefix :omar_blog
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @timestamps_opts [type: :utc_datetime_usec]

  schema "posts" do
    field :body, :string
    field :published, :utc_datetime_usec
    field :title, :string
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :published])
    |> validate_required([:title, :body, :published])
  end
end
