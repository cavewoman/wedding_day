defmodule WeddingDay.Repo.Migrations.AddImageToTodo do
  use Ecto.Migration

  def change do
    alter table(:todos) do
      add :image_url, :string
    end  
  end
end
