defmodule Words.Repo.Migrations.CreatePlayerItems do
  use Ecto.Migration

  def change do
    create table(:player_items) do
      add :player_id, references(:players, on_delete: :delete_all)
      add :item_id, references(:items, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end
  end
end
