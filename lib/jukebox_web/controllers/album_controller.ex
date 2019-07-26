defmodule JukeboxWeb.AlbumController do
  use JukeboxWeb, :controller

  alias Jukebox.Albums
  alias Jukebox.Albums.Album

  def index(conn, _params) do
    albums = Albums.list_albums()
    render(conn, "index.html", albums: albums)
  end

  def new(conn, _params) do
    changeset = Albums.change_album(%Album{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"album" => album_params}) do
    case Albums.create_album(album_params) do
      {:ok, album} ->
        conn
        |> put_flash(:info, "Album created successfully.")
        |> redirect(to: Routes.album_path(conn, :show, album))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    album = Albums.get_album_with_tracks!(id)
    render(conn, "show.html", album: album)
  end

  def edit(conn, %{"id" => id}) do
    album = Albums.get_album_with_tracks!(id)
    changeset = Albums.change_album(album)
    render(conn, "edit.html", album: album, changeset: changeset)
  end

  def update(conn, %{"id" => id, "album" => album_params}) do
    album = Albums.get_album_with_tracks!(id)

    case Albums.update_album(album, album_params) do
      {:ok, album} ->
        conn
        |> put_flash(:info, "Album updated successfully.")
        |> redirect(to: Routes.album_path(conn, :show, album))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", album: album, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    album = Albums.get_album!(id)
    {:ok, _album} = Albums.delete_album(album)

    conn
    |> put_flash(:info, "Album deleted successfully.")
    |> redirect(to: Routes.album_path(conn, :index))
  end
end
