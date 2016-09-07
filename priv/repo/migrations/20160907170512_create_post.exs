defmodule WeddingDay.Repo.Migrations.CreatePost do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :post_image, :string
      add :profile_image, :string
      add :handle, :string
      add :instagram_response, :map

      timestamps()
    end

  end
end
