defmodule WeddingDay.Repo.Migrations.AddImageUrlToMenuItem do
  use Ecto.Migration

  def change do
    alter table(:menu_items) do
      add :image_url, :string
    end
  end
end
