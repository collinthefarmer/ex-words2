defmodule Words.Repo.Migrations.AddUniquePlayerIndex do
  use Ecto.Migration

  def change do
    create unique_index(:players, [:room_id, :user_id])
  end
end
