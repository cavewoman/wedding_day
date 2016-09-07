defmodule WeddingDay.MenuItem do
  use WeddingDay.Web, :model

  schema "menu_items" do
    field :section, :string
    field :type, :string
    field :details, :string
    field :name, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:section, :type, :details, :name])
    |> validate_required([:section, :type, :details, :name])
  end
end
