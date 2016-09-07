defmodule WeddingDay.Repo.Migrations.CreateTodo do
  use Ecto.Migration

  def change do
    create table(:todos) do
      add :name, :string
      add :details, :string

      timestamps()
    end

  end
end
