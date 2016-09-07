defmodule WeddingDay.Todo do
  use WeddingDay.Web, :model

  schema "todos" do
    field :name, :string
    field :details, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :details])
    |> validate_required([:name, :details])
  end
end
