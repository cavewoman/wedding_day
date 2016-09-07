defmodule WeddingDay.MenuItemControllerTest do
  use WeddingDay.ConnCase

  alias WeddingDay.MenuItem
  @valid_attrs %{details: "some content", section: "some content", type: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, menu_item_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing menu items"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, menu_item_path(conn, :new)
    assert html_response(conn, 200) =~ "New menu item"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, menu_item_path(conn, :create), menu_item: @valid_attrs
    assert redirected_to(conn) == menu_item_path(conn, :index)
    assert Repo.get_by(MenuItem, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, menu_item_path(conn, :create), menu_item: @invalid_attrs
    assert html_response(conn, 200) =~ "New menu item"
  end

  test "shows chosen resource", %{conn: conn} do
    menu_item = Repo.insert! %MenuItem{}
    conn = get conn, menu_item_path(conn, :show, menu_item)
    assert html_response(conn, 200) =~ "Show menu item"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, menu_item_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    menu_item = Repo.insert! %MenuItem{}
    conn = get conn, menu_item_path(conn, :edit, menu_item)
    assert html_response(conn, 200) =~ "Edit menu item"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    menu_item = Repo.insert! %MenuItem{}
    conn = put conn, menu_item_path(conn, :update, menu_item), menu_item: @valid_attrs
    assert redirected_to(conn) == menu_item_path(conn, :show, menu_item)
    assert Repo.get_by(MenuItem, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    menu_item = Repo.insert! %MenuItem{}
    conn = put conn, menu_item_path(conn, :update, menu_item), menu_item: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit menu item"
  end

  test "deletes chosen resource", %{conn: conn} do
    menu_item = Repo.insert! %MenuItem{}
    conn = delete conn, menu_item_path(conn, :delete, menu_item)
    assert redirected_to(conn) == menu_item_path(conn, :index)
    refute Repo.get(MenuItem, menu_item.id)
  end
end
