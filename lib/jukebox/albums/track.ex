defmodule Jukebox.Albums.Track do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tracks" do
    field :name, :string
    belongs_to(:album, Album)

    timestamps()
  end

  @doc false
  def changeset(track, attrs) do
    track
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
