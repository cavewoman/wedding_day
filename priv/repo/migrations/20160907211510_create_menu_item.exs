defmodule WeddingDay.Repo.Migrations.CreateMenuItem do
  use Ecto.Migration

  def change do
    create table(:menu_items) do
      add :section, :string
      add :type, :string
      add :details, :string
      add :name, :string

      timestamps()
    end

  end
end
