defmodule WeddingDay.Todo do
  use WeddingDay.Web, :model

  schema "todos" do
    field :name, :string
    field :details, :string
    field :image_url, :string
    field :title, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :details, :image_url, :title])
    |> validate_required([:name, :details, :image_url, :title])
  end
end
