defmodule WeddingDay.MenuItemController do
  use WeddingDay.Web, :controller

  alias WeddingDay.MenuItem

  def index(conn, _params) do
    menu_items = Repo.all(MenuItem)
    render(conn, "index.html", menu_items: menu_items)
  end

  def new(conn, _params) do
    changeset = MenuItem.changeset(%MenuItem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"menu_item" => menu_item_params}) do
    changeset = MenuItem.changeset(%MenuItem{}, menu_item_params)

    case Repo.insert(changeset) do
      {:ok, _menu_item} ->
        conn
        |> put_flash(:info, "Menu item created successfully.")
        |> redirect(to: menu_item_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    menu_item = Repo.get!(MenuItem, id)
    render(conn, "show.html", menu_item: menu_item)
  end

  def edit(conn, %{"id" => id}) do
    menu_item = Repo.get!(MenuItem, id)
    changeset = MenuItem.changeset(menu_item)
    render(conn, "edit.html", menu_item: menu_item, changeset: changeset)
  end

  def update(conn, %{"id" => id, "menu_item" => menu_item_params}) do
    menu_item = Repo.get!(MenuItem, id)
    changeset = MenuItem.changeset(menu_item, menu_item_params)

    case Repo.update(changeset) do
      {:ok, menu_item} ->
        conn
        |> put_flash(:info, "Menu item updated successfully.")
        |> redirect(to: menu_item_path(conn, :show, menu_item))
      {:error, changeset} ->
        render(conn, "edit.html", menu_item: menu_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    menu_item = Repo.get!(MenuItem, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(menu_item)

    conn
    |> put_flash(:info, "Menu item deleted successfully.")
    |> redirect(to: menu_item_path(conn, :index))
  end
end
