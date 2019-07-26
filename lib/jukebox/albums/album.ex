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
    attrs =
      attrs
      |> remove_new_track_if_empty()

    album
    |> cast(attrs, [:name, :artist])
    |> validate_required([:name, :artist])
    |> cast_assoc(:tracks)
  end

  defp remove_new_track_if_empty(%{"tracks" => tracks} = attrs) do
    last_key = tracks |> Map.keys() |> Enum.reverse() |> hd

    new_name = attrs["tracks"][last_key]["name"]

    if String.trim(new_name) == "" do
      new_tracks = Map.drop(tracks, [last_key])
      %{attrs | "tracks" => new_tracks}
    else
      attrs
    end
    |> IO.inspect(label: "USE THIS ATTRS")
  end

  defp remove_new_track_if_empty(attrs) do
    attrs
  end
end
