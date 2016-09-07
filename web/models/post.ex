defmodule WeddingDay.Post do
  use WeddingDay.Web, :model

  schema "posts" do
    field :post_image, :string
    field :profile_image, :string
    field :handle, :string
    field :instagram_response, :map

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:post_image, :profile_image, :handle, :instagram_response])
    |> validate_required([:post_image, :profile_image, :handle])
  end
end
