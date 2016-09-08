defmodule WeddingDay.Repo.Migrations.AddTitleToTodo do
  use Ecto.Migration

  def change do
    alter table(:todos) do
      add :title, :string
    end
  end
end
