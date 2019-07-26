defmodule Jukebox.AlbumsTest do
  use Jukebox.DataCase

  alias Jukebox.Albums

  describe "albums" do
    alias Jukebox.Albums.Album

    @valid_attrs %{artist: "some artist", name: "some name"}
    @update_attrs %{artist: "some updated artist", name: "some updated name"}
    @invalid_attrs %{artist: nil, name: nil}

    def album_fixture(attrs \\ %{}) do
      {:ok, album} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Albums.create_album()

      album
    end

    test "list_albums/0 returns all albums" do
      album = album_fixture()
      assert Albums.list_albums() == [album]
    end

    test "get_album!/1 returns the album with given id" do
      album = album_fixture()
      assert Albums.get_album!(album.id) == album
    end

    test "create_album/1 with valid data creates a album" do
      assert {:ok, %Album{} = album} = Albums.create_album(@valid_attrs)
      assert album.artist == "some artist"
      assert album.name == "some name"
    end

    test "create_album/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Albums.create_album(@invalid_attrs)
    end

    test "update_album/2 with valid data updates the album" do
      album = album_fixture()
      assert {:ok, %Album{} = album} = Albums.update_album(album, @update_attrs)
      assert album.artist == "some updated artist"
      assert album.name == "some updated name"
    end

    test "update_album/2 with invalid data returns error changeset" do
      album = album_fixture()
      assert {:error, %Ecto.Changeset{}} = Albums.update_album(album, @invalid_attrs)
      assert album == Albums.get_album!(album.id)
    end

    test "delete_album/1 deletes the album" do
      album = album_fixture()
      assert {:ok, %Album{}} = Albums.delete_album(album)
      assert_raise Ecto.NoResultsError, fn -> Albums.get_album!(album.id) end
    end

    test "change_album/1 returns a album changeset" do
      album = album_fixture()
      assert %Ecto.Changeset{} = Albums.change_album(album)
    end
  end
end
