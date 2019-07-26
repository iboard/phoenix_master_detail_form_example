defmodule Jukebox.Albums.Album do
  use Ecto.Schema
  import Ecto.Changeset
  alias Jukebox.Albums.Track

  schema "albums" do
    field :artist, :string
    field :name, :string
    has_many(:tracks, Track, on_delete: :nothing)

    timestamps()
  end

  @doc false
  def changeset(album, attrs) do
    album
    |> cast(attrs, [:name, :artist])
    |> validate_required([:name, :artist])
    |> cast_assoc(:tracks)
  end
end
