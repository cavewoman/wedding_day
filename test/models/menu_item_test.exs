defmodule WeddingDay.MenuItemTest do
  use WeddingDay.ModelCase

  alias WeddingDay.MenuItem

  @valid_attrs %{details: "some content", section: "some content", type: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = MenuItem.changeset(%MenuItem{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = MenuItem.changeset(%MenuItem{}, @invalid_attrs)
    refute changeset.valid?
  end
end
