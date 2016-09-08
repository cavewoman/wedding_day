defmodule WeddingDay.MenuItem do
  use WeddingDay.Web, :model

  schema "menu_items" do
    field :section, :string
    field :type, :string
    field :details, :string
    field :name, :string
    field :image_url, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:section, :type, :details, :name, :image_url])
    |> validate_required([:section, :type, :details, :name])
  end
end
