defmodule WeddingDay.PostTest do
  use WeddingDay.ModelCase

  alias WeddingDay.Post

  @valid_attrs %{handle: "some content", instagram_response: %{}, post_image: "some content", profile_image: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
